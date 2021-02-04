# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/asandridge/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Turn on vi mode
bindkey -v
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# ZSH aliases
alias zshrc="vim ~/.zshrc && srczsh"
alias srczsh="echo 'sourcing zshrc...' && source ~/.zshrc"

# Git aliases
alias amend='~/repositories/bin/amendAndPush'
alias pushall='~/repositories/bin/commitAndPushAll'
alias stash='git reset HEAD^ --soft && git stash'
alias apply='git stash apply'
alias hard='git reset HEAD --hard'
alias st='git status'
alias reb="git fetch --all && stash && git checkout origin/master && apply"
alias log="git log"
alias master="git fetch --all && git checkout origin/master"
alias glast="git checkout -"
alias clean="git clean -df"

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
alias bp='vim ~/.bash_profile && sbp'
alias sbp='source ~/.bash_profile'
alias repos="cd ~/repositories"
alias projects="cd ~/Documents/Projects"
alias gph="git add . && git commit && git push origin HEAD"
alias brave="open -a 'Brave Browser'"
alias syncconf="cd ~/Documents/projects/config && cp ~/.vimrc .vimrc && cp ~/.zshrc .zshrc && cd -"

# Vim aliases
alias vimrc="vim ~/.vimrc"
alias vimplug="vim +PluginInstall +qall"
alias vimbund="vim +BundleInstall +qall"
alias vgolf="cd Documents/vimgolf"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
