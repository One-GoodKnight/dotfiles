export PATH=~/.local/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/junest/bin/:$PATH"

# Options

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Aliases
alias cc='clang'
alias ccc='cc -Wall -Wextra -Werror'
alias norm='norminette'

alias nv='nvim'

alias py='python3'

alias gcl='git clone'
alias gst='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

alias ls='ls --color=auto'
alias tree='tree -C'

alias steam='firejail steam'

# Word navigation (Ctrl + arrow keys)
bindkey "^[[1;5C" forward-word   # Ctrl + →
bindkey "^[[1;5D" backward-word  # Ctrl + ←

# Word delete
bindkey "^H" backward-kill-word  # Ctrl + Backspace
bindkey "^[[3;5~" kill-word       # Ctrl + Delete

# Don't delete whole word on esc release + del
bindkey '\e\177' backward-delete-char

# Better completion matcher
zstyle ':completion:*' matcher-list \
    'm:{[:lower:]}={[:upper:]}' \
    '+r:|[._-]=* r:|=*' \
    '+l:|=*'

# ---- ZINIT INIT ----
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
source "$ZINIT_HOME/zinit.zsh"

# ---- PLUGINS ----

# defer zsh scripts
zinit light romkatv/zsh-defer

_deferred_init() {
	# Initialize completion system
	autoload -U compinit
	compinit -C

	# core fuzzy engine
	zinit light junegunn/fzf

	# Tab completion with fzf
	zinit light Aloxaf/fzf-tab

	# Auto suggestions when typing
	zinit light zsh-users/zsh-autosuggestions
}

zsh-defer _deferred_init

PATH="${PATH:+${PATH}:}$HOME/.local/share/zinit/plugins/junegunn---fzf/bin"

# ---- STARSHIP ----
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# --- NVIM ---
if [ -x "$HOME/.local/nvim/bin/nvim" ]; then
  alias nvim="$HOME/.local/nvim/bin/nvim"
  export MANPAGER="$HOME/.local/nvim/bin/nvim +Man!"
else
  alias nvim="/usr/bin/nvim"
  export MANPAGER="/usr/bin/nvim +Man!"
fi

update-nvim() {
    rm -rf ~/.local/nvim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    tar -xzf nvim-linux-x86_64.tar.gz
    mv nvim-linux-x86_64 ~/.local/nvim
    rm nvim-linux-x86_64.tar.gz
}
