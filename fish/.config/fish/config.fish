if status is-interactive
    if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
        source /usr/share/cachyos-fish-config/cachyos-config.fish
    end

    set -gx EDITOR nvim
    set -gx VISUAL nvim

    if type -q zoxide
        zoxide init fish | source
    end
    if type -q direnv
        direnv hook fish | source
    end
end

for tool_path in "$HOME/.local/bin" "$HOME/.dotnet" "$HOME/.dotnet/tools" "$HOME/go/bin" "$HOME/.config/emacs/bin"
    if test -d "$tool_path"
        fish_add_path --global "$tool_path"
    end
end

alias vi nvim
alias vim nvim
alias lg lazygit

if not type -q fd; and type -q fdfind
    alias fd fdfind
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
