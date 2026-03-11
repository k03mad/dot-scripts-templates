#!/usr/bin/env bash

set -e

folders=(
    "oxlint-config        sleep_1"
    "simple-prom          sleep_1"
    "request              sleep_1"
    "ip2geo               sleep_1"
    "adg-mik-sync         sleep_2"
    "iptv-mp              sleep_2"
    "mik-prom-exporter    sleep_2"
    "sys-prom-exporter    sleep_2"
    "vdsina-prom-exporter sleep_2"
)

RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[1;33m'
BLUE=$'\033[0;34m'
PURPLE=$'\033[0;35m'
CYAN=$'\033[0;36m'
WHITE=$'\033[1;37m'
NC=$'\033[0m'

NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export NVM_DIR
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

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

analyze_dependency_changes() {
    local old_package="$1"
    local new_package="$2"
    local temp_file
    temp_file=$(mktemp)

    echo "patch" > "$temp_file"

    jq -r '.dependencies // {} | keys[]' "$old_package" 2>/dev/null | while read -r pkg_name; do
        old_ver=$(jq -r --arg key "$pkg_name" '.dependencies[$key]' "$old_package" 2>/dev/null)
        new_ver=$(jq -r --arg key "$pkg_name" '.dependencies[$key] // empty' "$new_package" 2>/dev/null)

        if [ -z "$new_ver" ]; then
            continue
        fi

        old_ver="${old_ver#[~^>=<]}"
        old_ver="${old_ver#[~^>=<]}"
        old_ver="${old_ver#[~^>=<]}"
        new_ver="${new_ver#[~^>=<]}"
        new_ver="${new_ver#[~^>=<]}"
        new_ver="${new_ver#[~^>=<]}"

        if [ "$old_ver" = "$new_ver" ]; then
            continue
        fi

        IFS='.' read -r old_major old_minor old_patch <<< "$old_ver"
        IFS='.' read -r new_major new_minor new_patch <<< "$new_ver"

        old_patch="${old_patch%%[!0-9]*}"
        new_patch="${new_patch%%[!0-9]*}"

        if [ "$old_major" != "$new_major" ]; then
            echo -e "    ${PURPLE}📦 $pkg_name: $old_ver → $new_ver (major)${NC}" >&2
            echo "major" > "$temp_file"
        elif [ "$old_minor" != "$new_minor" ]; then
            echo -e "    ${YELLOW}📦 $pkg_name: $old_ver → $new_ver (minor)${NC}" >&2
            current_max=$(cat "$temp_file")
            if [ "$current_max" != "major" ]; then
                echo "minor" > "$temp_file"
            fi
        elif [ "$old_patch" != "$new_patch" ]; then
            echo -e "    ${CYAN}📦 $pkg_name: $old_ver → $new_ver (patch)${NC}" >&2
        fi
    done

    jq -r '.devDependencies // {} | keys[]' "$old_package" 2>/dev/null | while read -r pkg_name; do
        old_ver=$(jq -r --arg key "$pkg_name" '.devDependencies[$key]' "$old_package" 2>/dev/null)
        new_ver=$(jq -r --arg key "$pkg_name" '.devDependencies[$key] // empty' "$new_package" 2>/dev/null)

        if [ -z "$new_ver" ]; then
            continue
        fi

        old_ver="${old_ver#[~^>=<]}"
        old_ver="${old_ver#[~^>=<]}"
        old_ver="${old_ver#[~^>=<]}"
        new_ver="${new_ver#[~^>=<]}"
        new_ver="${new_ver#[~^>=<]}"
        new_ver="${new_ver#[~^>=<]}"

        if [ "$old_ver" = "$new_ver" ]; then
            continue
        fi

        IFS='.' read -r old_major old_minor old_patch <<< "$old_ver"
        IFS='.' read -r new_major new_minor new_patch <<< "$new_ver"

        old_patch="${old_patch%%[!0-9]*}"
        new_patch="${new_patch%%[!0-9]*}"

        if [ "$old_major" != "$new_major" ]; then
            echo -e "    ${PURPLE}📦 $pkg_name: $old_ver → $new_ver (major)${NC}" >&2
            echo "major" > "$temp_file"
        elif [ "$old_minor" != "$new_minor" ]; then
            echo -e "    ${YELLOW}📦 $pkg_name: $old_ver → $new_ver (minor)${NC}" >&2
            current_max=$(cat "$temp_file")
            if [ "$current_max" != "major" ]; then
                echo "minor" > "$temp_file"
            fi
        elif [ "$old_patch" != "$new_patch" ]; then
            echo -e "    ${CYAN}📦 $pkg_name: $old_ver → $new_ver (patch)${NC}" >&2
        fi
    done

    local max_change
    max_change=$(cat "$temp_file")
    rm -f "$temp_file"
    echo "$max_change"
}

update_version() {
    local old_package_file="$1"
    local package_file="package.json"

    local current_version
    current_version=$(grep '"version":' "$package_file" | sed 's/.*"version": *"\([^"]*\)".*/\1/')

    if [ -z "$current_version" ]; then
        echo -e "  ${RED}❌ Не удалось найти версию в package.json${NC}"
        return
    fi

    echo -e "  ${CYAN}🏷️  Текущая версия: ${WHITE}$current_version${NC}"

    IFS='.' read -r major minor patch <<< "$current_version"

    local change_level="patch"

    if [ -n "$old_package_file" ] && [ -f "$old_package_file" ]; then
        echo -e "  ${CYAN}🔍 Анализирую изменения зависимостей${NC}"
        change_level=$(analyze_dependency_changes "$old_package_file" "$package_file")
    fi

    echo -e "  ${CYAN}📊 Уровень изменений: ${WHITE}$change_level${NC}"

    case "$change_level" in
        "major")
            major=$((major + 1))
            minor=0
            patch=0
            ;;
        "minor")
            minor=$((minor + 1))
            patch=0
            ;;
        "patch")
            patch=$((patch + 1))
            ;;
    esac

    local new_version="$major.$minor.$patch"
    echo -e "  ${PURPLE}🏷️  Новая версия: ${WHITE}$new_version${NC}"

    sed "s/\"version\": *\"[^\"]*\"/\"version\": \"$new_version\"/" "$package_file" > "$package_file.tmp" && mv "$package_file.tmp" "$package_file"

    echo -e "  ${GREEN}✅ Версия обновлена в package.json${NC}"
}

process_folder() {
    local folder_name="$1"
    local timeout="$2"
    local skip_update="$3"

    print_separator
    echo -e "${CYAN}⚙️  Обрабатываю папку: ${WHITE}$folder_name${NC}"
    print_separator

    if [ ! -d "$folder_name" ]; then
        echo -e "${YELLOW}⚠️ Папка $folder_name не найдена, пропускаю${NC}"
        return
    fi

    cd "$folder_name" || return

    if [ ! -d ".git" ]; then
        echo -e "${YELLOW}⚠️ В папке $folder_name нет git репозитория, пропускаю${NC}"
        cd .. || return
        return
    fi

    if [ ! -f "package.json" ]; then
        echo -e "${YELLOW}⚠️ В папке $folder_name нет package.json, выполняю только git операции${NC}"

        echo -e "  ${BLUE}🔀 git reset${NC}"
        git reset --hard

        echo -e "  ${BLUE}⬇️  git pull${NC}"
        git pull

        echo -e "  ${GREEN}✅ Git операции выполнены, переходим к следующей папке${NC}"
        cd .. || return
        return
    fi

    echo -e "  ${BLUE}🔀 git reset${NC}"
    git reset --hard

    echo -e "  ${BLUE}⬇️  git pull${NC}"
    git pull

    echo -e "  ${BLUE}📦 nvm use${NC}"
    nvm use

    echo -e "  ${BLUE}📦 pnpm i${NC}"
    pnpm i

    if [ "$skip_update" = "skip_ncu" ]; then
        echo -e "  ${YELLOW}⏭️ Пропускаю обновление зависимостей (skip_ncu)${NC}"
        cd .. || return
        return
    fi

    echo -e "  ${PURPLE}🔄 ncu${NC}"

    local temp_dir
    local old_package_file
    temp_dir=$(mktemp -d)
    old_package_file="$temp_dir/package.json.old"
    cp package.json "$old_package_file"

    ncu --no-cache -u

    echo -e "  ${CYAN}📊 git status${NC}"
    git status

    local git_status_after
    git_status_after=$(git status --porcelain)

    if [ -z "$git_status_after" ]; then
        echo -e "  ${GREEN}✅ Нет изменений, переходим к следующей папке${NC}"
        rm -rfv "$temp_dir"
        cd .. || return
        return
    fi

    echo -e "  ${CYAN}🏷️  Обновляю версию в package.json${NC}"
    update_version "$old_package_file"
    rm -rfv "$temp_dir"

    echo -e "  ${YELLOW}🗑️  remove node_modules${NC}"
    rm -rf node_modules

    echo -e "  ${YELLOW}🗑️  remove lock${NC}"
    rm -rfv package-lock.json pnpm-lock.yaml

    echo -e "  ${BLUE}📦 pnpm i${NC}"
    pnpm i

    echo -e "  ${BLUE}🔀 git add${NC}"
    git add .

    echo -e "  ${CYAN}📊 git status${NC}"
    git status

    echo -e "  ${BLUE}💾 git commit${NC}"
    git commit -m "update deps"

    echo -e "  ${BLUE}⬆️  git push${NC}"
    git push

    if [ "$timeout" -gt 0 ]; then
        countdown "$timeout"
    fi

    echo -e "  ${GREEN}✅ Папка ${WHITE}$folder_name${GREEN} обработана успешно${NC}"

    cd .. || return
}

get_remaining_folders() {
    local priority_folders=()

    for item in "${folders[@]}"; do
        read -r folder_name _ <<< "$item"
        priority_folders+=("$folder_name")
    done

    for dir in */; do
        local dir_name="${dir%/}"

        if [[ "$dir_name" == .* ]]; then
            continue
        fi

        local is_priority=false
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

cd ~/git || exit 1
echo -e "${CYAN}📁 Текущая директория: ${WHITE}$(pwd)${NC}"

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
