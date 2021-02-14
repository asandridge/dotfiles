# Bash aliases
alias sourcerc='echo "Sourcing bash profile..." && source ~/.bashrc'
alias rc='vim ~/.bashrc && sourcerc'

# Vim aliases
alias vimrc="vim ~/.vimrc"
alias vimplug="vim +PluginInstall +qall"

# Git aliases
alias soft='git reset HEAD^ --soft'
alias stash='git stash'
alias apply='git stash apply'
alias hard='git reset HEAD --hard'
alias gs='git status'
alias reb="git fetch --all && soft && stash && git checkout origin/master && apply"
alias gl="git log"
alias master="git fetch --all && git checkout origin/master"
alias glast="git checkout -"
alias gclean="git clean -df"
alias gcp="git add . && git commit && git push origin HEAD"

# Other useful aliases
alias c='clear'
alias projects="cd ~/Documents/Projects"
alias brave="open -a 'Brave Browser'"
