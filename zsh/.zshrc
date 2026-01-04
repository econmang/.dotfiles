# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path
export PROJDIR="$HOME"
export PATH=/usr/local/go/bin:$PATH
export PATH=~/.bun/bin/bun:$PATH

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

# Compilation flags

# Aliases
alias py=python3
alias vi=nvim
alias vim=nvim
alias nivm=nvim
alias icat="kitten icat"

# Key Binds
bindkey -s '^F' 'cd $(~/.config/.local/bin/fzf-finder.zsh) && PROJDIR=$(pwd) && clear^M'
bindkey -s '^L' 'cd $(~/.config/.local/bin/fzf-lister.zsh) && PROJDIR=$(pwd) && clear^M'
# bindkey -s '^T' '~/.config/.local/bin/tmux-sessionizer.zsh^M'
# bindkey -s '^S' '~/.config/.local/bin/tmux-sessionlister.zsh && clear^M'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export LS_COLORS=$LS_COLORS:'ow=1;100;34'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/econmang/.ghcup/env" ] && . "/home/econmang/.ghcup/env" # ghcup-env

# bun completions
[ -s "/home/econmang/.bun/_bun" ] && source "/home/econmang/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
