# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path
export PROJDIR="$HOME"
export PATH=/usr/java/jre1.8.0_371/bin:$PATH
export PATH=/usr/lib/jvm/jdk-20/bin:$PATH
export PATH=/opt/gradle/gradle-8.1.1/bin:$PATH
export PATH=/home/econmang/.buildsources/Odin:$PATH
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
bindkey -s '^T' '~/.config/.local/bin/tmux-sessionizer.zsh^M'
bindkey -s '^S' '~/.config/.local/bin/tmux-sessionlister.zsh && clear^M'
bindkey -s '^W' 'PROJDIR=$(pwd) && clear^M'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:/home/econmang/.spicetify
export LS_COLORS=$LS_COLORS:'ow=1;100;34'

[ -f "/home/econmang/.ghcup/env" ] && source "/home/econmang/.ghcup/env" # ghcup-env

# opam configuration
[[ ! -r /home/econmang/.opam/opam-init/init.zsh ]] || source /home/econmang/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
