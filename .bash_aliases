# Bash aliases
alias srcaliases='echo "Sourcing aliases..." && source ~/dotfiles/.bash_aliases'
alias aliases='vim ~/dotfiles/.bash_aliases && srcaliases'
alias srcbrc='echo "Sourcing bashrc..." && source ~/.bashrc'
alias bashrc='vim ~/.bashrc && srcbrc'

# Vim aliases
alias vimrc="vim ~/.vimrc"
alias vimplug="vim +PluginInstall +qall"
alias viminstall="ln -s ~/dotfiles/.vimrc ~/.vimrc && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vimplug"

# Git aliases
alias gs='git status'
alias gl="git log"
alias gd="git diff"
alias glast="git checkout -"
alias clean="git clean -df"
alias push="git add . && git commit && git push origin HEAD"
alias soft='git reset HEAD^ --soft'
alias stash='git stash'
alias ss="soft && stash"
alias apply='git stash apply'
alias hard='git reset HEAD --hard'
alias master="git fetch --all && git checkout origin/master"
alias reset="git reset HEAD"

# CD aliases
alias repos="cd /Users/asandridge/repos"

# Other useful aliases
alias c='clear'
alias e="exit"
alias python="python3"
