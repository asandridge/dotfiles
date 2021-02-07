PS1="\u \w -> "

# Bash aliases
alias sourcerc='echo "Sourcing bash profile..." && source ~/.bashrc'
alias rc='vim ~/.bashrc && sourcerc'

# Vim aliases
alias vimrc="vim ~/.vimrc"
alias vimplug="vim +PluginInstall +qall"

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

# Other useful aliases
alias c='clear'
alias repos="cd ~/repositories"
alias projects="cd ~/Documents/Projects"
alias gp="git add . && git commit && git push origin HEAD"
alias brave="open -a 'Brave Browser'"
alias upconf="cd ~/Documents/projects/config && cp ~/.vimrc .vimrc && cp ~/.zshrc .zshrc && cp ~/.bashrc .bashrc && gp && cd -"
alias dconf="cd ~/Documents/projects/config && git pull origin master && cp .vimrc ~/.vimrc && cp .zshrc ~/.zshrc && cp .bashrc ~/.bashrc && cd -"
