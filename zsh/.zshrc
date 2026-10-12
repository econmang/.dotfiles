# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path
export PROJDIR="$HOME"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.dotnet:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.config/emacs/bin" ] && export PATH="$HOME/.config/emacs/bin:$PATH"

# Set Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

xcat() {
	cat -- "$@" | xclip -selection clipboard
}

# Aliases
alias py=python3
alias vi=nvim
alias vim=nvim
alias nivm=nvim
alias icat="kitten icat"
if ! command -v fd >/dev/null 2>&1 && command -v fdfind >/dev/null 2>&1; then
  alias fd=fdfind
fi

# Key Binds
bindkey -s '^F' 'cd $(~/.config/.local/bin/fzf-finder.zsh) && PROJDIR=$(pwd) && clear^M'
bindkey -s '^L' 'cd $(~/.config/.local/bin/fzf-lister.zsh) && PROJDIR=$(pwd) && clear^M'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export LS_COLORS=$LS_COLORS:'ow=1;100;34'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Optional tools installed outside the distro package manager.
[ -d "$HOME/.spicetify" ] && export PATH="$PATH:$HOME/.spicetify"

# opencode
[ -d "$HOME/.opencode/bin" ] && export PATH="$HOME/.opencode/bin:$PATH"

command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"
