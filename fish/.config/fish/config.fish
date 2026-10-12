if status is-interactive
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    if test -d "$HOME/.config/emacs/bin"
        set -gx PATH "$HOME/.config/emacs/bin" $PATH
    end
    if test -d "$HOME/.dotnet/tools"
        set -gx PATH "$HOME/.dotnet/tools" $PATH
    end
    if test -d "$HOME/go/bin"
        set -gx PATH "$HOME/go/bin" $PATH
    end
    if type -q zoxide
        zoxide init fish | source
    end
    if type -q direnv
        direnv hook fish | source
    end
end

alias vi nvim
alias vim nvim
alias lg lazygit

if not type -q fd; and type -q fdfind
    alias fd fdfind
end
