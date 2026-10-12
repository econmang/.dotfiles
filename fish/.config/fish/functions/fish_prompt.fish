function fish_prompt
    # Must be captured before running anything else.
    set -l last_status $status

    # Configure Fish's built-in Git prompt once per shell.
    if not set -q __robby_fish_prompt_initialized
        set -g __robby_fish_prompt_initialized 1

        set -g __fish_git_prompt_showdirtystate 1
        set -g __fish_git_prompt_showuntrackedfiles 1
        set -g __fish_git_prompt_showcolorhints 1

        set -g __fish_git_prompt_color_branch red
        set -g __fish_git_prompt_color_branch_dirty red
        set -g __fish_git_prompt_color_dirtystate yellow
        set -g __fish_git_prompt_color_stagedstate yellow
        set -g __fish_git_prompt_color_untrackedfiles yellow

        set -g __fish_git_prompt_char_dirtystate '✗'
        set -g __fish_git_prompt_char_stagedstate '+'
        set -g __fish_git_prompt_char_untrackedfiles '?'
    end

    # Show only the current directory name:
    # /home/econmang/projects/MillVector -> MillVector
    # /home/econmang                    -> econmang
    set -l current_dir (path basename "$PWD")

    if test "$PWD" = /
        set current_dir /
    end

    set_color cyan
    printf '%s' "$current_dir"
    set_color normal

    set -l git_info (fish_git_prompt '%s' | string collect)

    if test -n "$git_info"
        set_color blue
        printf ' git:('

        set_color normal
        printf '%s' "$git_info"

        set_color blue
        printf ')'
        set_color normal
    end

    printf '\n'

    # Green arrow after successful command, red after failure.
    if test $last_status -eq 0
        set_color --bold green
    else
        set_color --bold red
    end

    printf '➜ '
    set_color normal
end
