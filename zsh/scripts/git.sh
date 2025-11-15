#!/usr/bin/env bash

set -e

folders=(
    "eslint-config        sleep_1"
    "simple-date          sleep_1"
    "simple-prom          sleep_1"
    "request              sleep_1"
    "ip2geo               sleep_1"
    "mik-prom-exporter    sleep_3"
    "sys-prom-exporter    sleep_3"
    "vdsina-prom-exporter sleep_3"
    "iptv-mp"
    "wp-color-apk         skip_ncu"
)

RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[1;33m'
BLUE=$'\033[0;34m'
PURPLE=$'\033[0;35m'
CYAN=$'\033[0;36m'
WHITE=$'\033[1;37m'
NC=$'\033[0m'

print_separator() {
    local width
    local separator
    width=$(tput cols 2>/dev/null || echo 80)
    separator=$(printf "%*s" "$width" "" | tr ' ' '-')
    printf "${BLUE}%s${NC}\n" "$separator"
}

countdown() {
    local minutes=$1
    local total_seconds=$((minutes * 60))

    for ((i=total_seconds; i>0; i--)); do
        local mins=$((i / 60))
        local secs=$((i % 60))
        printf "\r  %s⏰ Ожидание: %02d:%02d%s" "$YELLOW" $mins $secs "$NC"
        sleep 1
    done
    printf "\r  %s✅ Ожидание завершено!%s     \n" "$GREEN" "$NC"
}

update_version() {
    local package_file="package.json"

    local current_version
    current_version=$(grep '"version":' "$package_file" | sed 's/.*"version": *"\([^"]*\)".*/\1/')

    if [ -z "$current_version" ]; then
        echo -e "  ${YELLOW}⚠️  Не удалось найти версию в package.json${NC}"
        return
    fi

    echo -e "  ${BLUE}📋 Текущая версия: ${WHITE}$current_version${NC}"

    IFS='.' read -r major minor patch <<< "$current_version"

    if [ "$patch" -lt 10 ]; then
        patch=$((patch + 1))
    else
        patch=0
        if [ "$minor" -lt 10 ]; then
            minor=$((minor + 1))
        else
            minor=0
            major=$((major + 1))
        fi
    fi

    local new_version="$major.$minor.$patch"
    echo -e "  ${PURPLE}🔢 Новая версия: ${WHITE}$new_version${NC}"

    sed "s/\"version\": *\"[^\"]*\"/\"version\": \"$new_version\"/" "$package_file" > "$package_file.tmp" && mv "$package_file.tmp" "$package_file"

    echo -e "  ${GREEN}✅ Версия обновлена в package.json${NC}"
}

process_folder() {
    local folder_name="$1"
    local timeout="$2"
    local skip_update="$3"

    print_separator
    echo -e "${CYAN}🔄 Обрабатываю папку: ${WHITE}$folder_name${NC}"
    print_separator

    if [ ! -d "$folder_name" ]; then
        echo -e "${RED}❌ Папка $folder_name не найдена, пропускаю${NC}"
        return
    fi

    cd "$folder_name"

    if [ ! -d ".git" ]; then
        echo -e "${RED}❌ В папке $folder_name нет git репозитория, пропускаю${NC}"
        cd ..
        return
    fi

    if [ ! -f "package.json" ]; then
        echo -e "${YELLOW}⚠️  В папке $folder_name нет package.json, выполняю только git операции${NC}"

        echo -e "  ${BLUE}📥 git reset --hard${NC}"
        git reset --hard

        echo -e "  ${BLUE}📥 git pull${NC}"
        git pull

        echo -e "  ${GREEN}✅ Git операции выполнены, переходим к следующей папке${NC}"
        cd ..
        return
    fi

    echo -e "  ${BLUE}📥 git reset --hard${NC}"
    git reset --hard

    echo -e "  ${BLUE}📥 git pull${NC}"
    git pull

    echo -e "  ${BLUE}📦 nvm use${NC}"
    ~/.nvm/nvm-exec use || true

    echo -e "  ${BLUE}📦 npm i${NC}"
    npm i

    if [ "$skip_update" = "skip_ncu" ]; then
        echo -e "  ${YELLOW}⏭️  Пропускаю обновление зависимостей (skip_ncu)${NC}"
        cd ..
        return
    fi

    echo -e "  ${PURPLE}🔍 ncu -u${NC}"
    ncu -u

    git_status_after=$(git status --porcelain)

    if [ -z "$git_status_after" ]; then
        echo -e "  ${GREEN}✅ Нет изменений после ncu -u, переходим к следующей папке${NC}"
        cd ..
        return
    fi

    echo -e "  ${CYAN}🔄 Обновляю версию в package.json${NC}"
    update_version

    echo -e "  ${YELLOW}🧹 npm cache clean${NC}"
    npm cache clean --force

    echo -e "  ${YELLOW}🧹 remove node_modules${NC}"
    rm -rf node_modules

    echo -e "  ${YELLOW}🧹 remove lock${NC}"
    rm -rf package-lock.json

    echo -e "  ${BLUE}📦 npm i${NC}"
    npm i

    echo -e "  ${BLUE}📝 git add .${NC}"
    git add .

    echo -e "  ${BLUE}📊 git status${NC}"
    git status

    echo -e "  ${BLUE}💾 git commit${NC}"
    git commit -m "update deps"

    echo -e "  ${BLUE}📤 git push${NC}"
    git push

    if [ "$timeout" -gt 0 ]; then
        countdown "$timeout"
    fi

    echo -e "  ${GREEN}✅ Папка ${WHITE}$folder_name${GREEN} обработана успешно${NC}"

    cd ..
}

get_remaining_folders() {
    local priority_folders=()

    for item in "${folders[@]}"; do
        read -r folder_name _ <<< "$item"
        priority_folders+=("$folder_name")
    done

    for dir in */; do
        dir_name="${dir%/}"

        if [[ "$dir_name" == .* ]]; then
            continue
        fi

        is_priority=false
        for priority_folder in "${priority_folders[@]}"; do
            if [ "$dir_name" = "$priority_folder" ]; then
                is_priority=true
                break
            fi
        done

        if [ "$is_priority" = false ]; then
            echo "$dir_name"
        fi
    done
}

echo -e "${WHITE}🚀 Начинаю обновление зависимостей в проектах${NC}"
echo -e "${BLUE}📁 Текущая директория: ${WHITE}$(pwd)${NC}"

echo ""
echo -e "${PURPLE}🔥 Обрабатываю приоритетные папки:${NC}"
echo ""

for item in "${folders[@]}"; do
    read -r folder_name timeout_or_flag <<< "$item"
    if [[ -n "$timeout_or_flag" ]]; then
        if [[ "$timeout_or_flag" == "skip_ncu" ]]; then
            timeout="0"
            skip_flag="skip_ncu"
        elif [[ "$timeout_or_flag" == sleep_* ]]; then
            timeout="${timeout_or_flag#sleep_}"
            skip_flag=""
        else
            timeout="$timeout_or_flag"
            skip_flag=""
        fi
    else
        timeout="0"
        skip_flag=""
    fi

    process_folder "$folder_name" "$timeout" "$skip_flag"
    echo ""
done

echo ""
echo -e "${PURPLE}📂 Обрабатываю остальные папки:${NC}"
echo ""

remaining_folders=()
while IFS= read -r folder; do
    remaining_folders+=("$folder")
done < <(get_remaining_folders)

for folder_name in "${remaining_folders[@]}"; do
    process_folder "$folder_name" "0" ""
    echo ""
done

echo -e "${GREEN}🎉 Все папки обработаны!${NC}"
