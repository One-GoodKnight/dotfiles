# Aliases
alias cc='clang'

alias nv='nvim'

alias py='python3'

alias gcl='git clone'
alias gst='git status'
alias gc='git commit -m'
alias gp='git push'

alias ls='ls --color=auto'
alias tree='tree -C'

# Word navigation (Ctrl + arrow keys)
bindkey "^[[1;5C" forward-word   # Ctrl + →
bindkey "^[[1;5D" backward-word  # Ctrl + ←

# Word delete
bindkey "^H" backward-kill-word  # Ctrl + Backspace
bindkey "^[[3;5~" kill-word       # Ctrl + Delete

# ---- ZINIT INIT ----
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
source "$ZINIT_HOME/zinit.zsh"

# Better completion matcher
zstyle ':completion:*' matcher-list \
    'm:{[:lower:]}={[:upper:]}' \
    '+r:|[._-]=* r:|=*' \
    '+l:|=*'

autoload -U compinit
compinit

# ---- PLUGINS ----

# core fuzzy engine
zinit light junegunn/fzf

# tab selection
zinit light Aloxaf/fzf-tab

# autosuggestions (suggest commands as you type)
zinit light zsh-users/zsh-autosuggestions

# ---- STARSHIP ----
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

