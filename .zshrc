PROMPT='%F{208}%n%f %F{226}%~%f -> '

# ZSH aliases
alias zshrc="vim ~/.zshrc && srczsh"
alias srczsh="echo 'sourcing zshrc...' && source ~/.zshrc"

# Git aliases
alias amend='git add -A && git commit --amend && git push origin HEAD:refs/for/master'
alias pushall='git add -A && git commit && git push origin HEAD:refs/for/master'
alias stash='git reset HEAD^ --soft && git stash'
alias apply='git stash apply'
alias hard='git reset HEAD --hard'
alias st='git status'
alias reb="git fetch --all && stash && git checkout origin/master && apply"
alias gl="git log"
alias master="git fetch --all && git checkout origin/master"
alias glast="git checkout -"
alias gclean="git clean -df"

# spotx-web-platform aliases
alias platform='cd ~/repositories/spotx-web-platform/test/e2e'
alias lint='yarn run lint'

# spotx-js-e2e aliases
alias eighties="cd ~/repositories/spotx-js-e2e"
alias lint80='./node_modules/.bin/eslint .'
alias ui="npm run clean && npx wdio config/wdio.local.conf.js"
alias uib="npm run clean && npx wdio config/wdio.browserstack.chrome.conf.js"
alias uih="ui --headless=true"
alias beacon="npm run clean && npx wdio config/wdio.beacon.conf.js"
alias beaconb="npm run clean && npx wdio config/wdio.browserstack.beacon.chrome.conf.js"
alias beaconh="beacon --headless=true"
alias aui="npm run clean && npx wdio config/wdio.browserstack.android.conf.js"
alias ab="npm run clean && npx wdio config/wdio.browserstack.beacon.android.conf.js"
alias iui="npm run clean && npx wdio config/wdio.browserstack.ios.conf.js"
alias fui="npm run clean && npx wdio config/wdio.browserstack.firefox.conf.js"
alias fb="npm run clean && npx wdio config/wdio.browserstack.beacon.firefox.conf.js"

# Other work aliases
alias cpc3="cd ~/repositories/cpc3po"
alias dumpjan="cpc3 && master && ./bin/dump.sh -h db.jan.lod -u liquibase -pmigr@tions"
alias sm3="cd ~/repositories/spotmarket/automation"
alias sma="cd ~/repositories/spotmarket-automation"
alias rsct="cd ~/repositories/spotmarket && make docker-down && make docker-up && make docker-test-env"
alias deployoc="cpc3 && cd gds-change-tool && master && make run && make oc-login && make bring-up-full-stack release=alex-test && make gds-change-prep && make forward-cpc3po release=alex-test"
alias dumplocal="./bin/dump.sh -h 127.0.0.1 -u liquibase -p migr@tions -n host -P 3307"

# Other useful aliases
alias c='clear'
alias repos="cd ~/repositories"
alias projects="cd ~/Documents/Projects"
alias gp="git add . && git commit && git push origin HEAD"
alias brave="open -a 'Brave Browser'"
alias upconf="cd ~/Documents/projects/config && cp ~/.vimrc .vimrc && cp ~/.zshrc .zshrc && gp && cd -"
alias dconf="curl https://raw.githubusercontent.com/asandridge/config/master/.vimrc > ~/.vimrc && https://raw.githubusercontent.com/asandridge/config/master/.zshrc > ~/.zshrc"

# Vim aliases
alias vimrc="vim ~/.vimrc"
alias vimplug="vim +PluginInstall +qall"

