function workdir \
    --description 'Select a working directory with fzf and update WORKINGDIR'

    if not type -q fzf
        echo 'workdir: fzf is not installed' >&2
        return 127
    end

    # Search $HOME unless another root is provided:
    #
    #   workdir
    #   workdir ~/Development
    #   workdir ~/Documents/projects
    set -l search_root "$HOME"

    if test (count $argv) -ge 1
        set search_root "$argv[1]"
    end

    if not test -d "$search_root"
        echo "workdir: not a directory: $search_root" >&2
        return 1
    end

    set search_root (path resolve "$search_root")

    set -l selected (
        find "$search_root" \
            -mindepth 0 \
            -maxdepth 3 \
            '(' \
                -name .git \
                -o -name node_modules \
                -o -name .cache \
            ')' -prune \
            -o -type d -print0 \
            2>/dev/null |
        fzf \
            --read0 \
            --print0 \
            --height=70% \
            --layout=reverse \
            --border \
            --prompt='workdir> ' |
        string split0
    )

    # Escape or Ctrl-C: make no changes.
    if not set -q selected[1]
        return 0
    end

    builtin cd -- "$selected"; or return 1

    # Global to this Fish process and exported to programs launched from it.
    set -gx WORKINGDIR "$PWD"

    printf 'WORKINGDIR=%s\n' "$WORKINGDIR"
end
