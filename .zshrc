# Load version control information
autoload -Uz vcs_info
precmd() {
    vcs_info
    VCS_COLOR="010"
    if [[ $vcs_info_msg_0_ == *" *"* || $vcs_info_msg_0_ == *" +"* ]]; then
        VCS_COLOR="011"
    fi
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats ' (%b%u%c)'

setopt PROMPT_SUBST
PROMPT='%F{208}%n%f %F{003}%~%f%F{${VCS_COLOR}}${vcs_info_msg_0_}%f -> '

PATH=$PATH:~/dotfiles/bin

bindkey '^R' history-incremental-search-backward

KEYTIMEOUT=1

source ~/dotfiles/.aliases

# ZSH aliases
alias srczrc="echo 'Sourcing zshrc...' && source ~/dotfiles/.zshrc"
alias zshrc="vim ~/dotfiles/.zshrc && srczrc"
