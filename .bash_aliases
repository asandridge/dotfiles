# Bash aliases
alias srcaliases='echo "Sourcing aliases..." && source ~/dotfiles/.bash_aliases'
alias aliases='vim ~/dotfiles/.bash_aliases && srcaliases'
alias srcbrc='echo "Sourcing bashrc..." && source ~/.bashrc'
alias bashrc='vim ~/.bashrc && srcbrc'

# Vim aliases
alias vimrc="vim ~/.vimrc"
alias vimplug="vim +PluginInstall +qall"

# Git aliases
alias gs='git status'
alias gl="git log"
alias gd="git diff"
alias glast="git checkout -"
alias gclean="git clean -df"
alias gcp="git add . && git commit && git push origin HEAD"
alias soft='git reset HEAD^ --soft'
alias stash='git stash'
alias apply='git stash apply'
alias hard='git reset HEAD --hard'
alias reb="git fetch --all && soft && stash && git checkout origin/master && apply"
alias master="git fetch --all && git checkout origin/master"

# Other useful aliases
alias c='clear'
alias projects="cd ~/Documents/Projects"
alias brave="open -a 'Brave Browser'"
