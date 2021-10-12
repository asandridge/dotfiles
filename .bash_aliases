# Bash aliases
alias srcaliases='echo "Sourcing aliases..." && source ~/dotfiles/.bash_aliases'
alias aliases='vim ~/dotfiles/.bash_aliases && srcaliases'
alias srcbrc='echo "Sourcing bashrc..." && source ~/.bashrc'
alias bashrc='vim ~/.bashrc && srcbrc'

# Vim aliases
alias vimrc="vim ~/.vimrc"
alias vimplug="vim +PluginInstall +qall"
alias vim_install="ln -s ~/dotfiles/.vimrc ~/.vimrc && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim"

# Git aliases
alias gs='git status'
alias gl="git log"
alias gd="git diff"
alias glast="git checkout -"
alias gclean="git clean -df"
alias gcp="git add . && git commit && git push origin HEAD"
alias soft='git reset HEAD^ --soft'
alias stash='git stash'
alias ss="soft && stash"
alias apply='git stash apply'
alias hard='git reset HEAD --hard'
alias reb="git fetch --all && soft && stash && git checkout origin/master && apply"
alias reblast="soft && stash && glast && apply"
alias rebnext="glast && soft && stash && glast && apply"
alias master="git fetch --all && git checkout origin/master"
alias reset="git reset HEAD"
alias amend="git add -A && git commit --amend && git push origin HEAD:refs/for/master"
alias pushall="git add -A && git commit && git push origin HEAD:refs/for/master"
alias pushwip="git add -A && git commit && git push origin HEAD:refs/for/master%wip"

# CD aliases
alias repos="cd /Users/asandridge/repositories"
alias sm3="cd /Users/asandridge/repositories/spotmarket"
alias sm2="cd /Users/asandridge/repositories/spotx-web-spotmarket"
alias auto="cd /Users/asandridge/repositories/spotmarket/automation"
alias cpc3="cd /Users/asandridge/repositories/cpc3po"
alias sqa="cd /Users/asandridge/repositories/sqa"

# Other useful aliases
alias c='clear'
alias e="exit"
alias projects="cd ~/Documents/Projects"
alias python="python3"
