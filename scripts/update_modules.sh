# brew should be preinstalled https://brew.sh/index_ru.html

function ___print {
    echo -e "\033[0;33m🤖  $1 \033[0m"
}

___print "brew: update"
brew update
brew upgrade
brew tap caskroom/cask

___print "npm: install npm-check-updates"
npm i npm -g
npm i npm-check-updates -g

___print "npm: update global"
npm ls --depth=0 -g
ncu -g
for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4)
do
    echo $package
    npm i "$package" -g
done
