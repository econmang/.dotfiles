# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path
export PROJDIR="$HOME"
export PATH=/usr/java/jre1.8.0_371/bin:$PATH
export PATH=/usr/lib/jvm/jdk-20/bin:$PATH
export PATH=/opt/gradle/gradle-8.1.1/bin:$PATH
export PATH=/home/econmang/.buildsources/Odin:$PATH
export PATH=/usr/local/go/bin:$PATH
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"
# pnpm
export PNPM_HOME="/home/econmang/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

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
alias pn=pnpm

# Key Binds
bindkey -s '^F' 'cd $(~/.config/.local/bin/fzf-finder.zsh) && PROJDIR=$(pwd) && clear^M'
bindkey -s '^L' 'cd $(~/.config/.local/bin/fzf-lister.zsh) && PROJDIR=$(pwd) && clear^M'
bindkey -s '^T' '~/.config/.local/bin/tmux-sessionizer.zsh^M'
bindkey -s '^S' '~/.config/.local/bin/tmux-sessionlister.zsh && clear^M'
bindkey -s '^W' 'PROJDIR=$(pwd) && clear^M'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:/home/econmang/.spicetify
export LS_COLORS=$LS_COLORS:'ow=1;100;34'

[ -f "/home/econmang/.ghcup/env" ] && source "/home/econmang/.ghcup/env" # ghcup-env

# opam configuration
[[ ! -r /home/econmang/.opam/opam-init/init.zsh ]] || source /home/econmang/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/econmang/.bun/_bun" ] && source "/home/econmang/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
