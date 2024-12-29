# Instructions

## Prerequisites

1. Install `zsh` and set as default shell:

    ```
    sudo apt install zsh
    chsh -s $(which zsh)
    ```
2. Install neovim (`nvim`):
    Instructions found [here](https://github.com/neovim/neovim/blob/master/BUILD.md).
3. Install Tools:
    - `tmux`:
        ```
        apt install tmux
        ```
    - `stow`:
        ```
        apt install stow
        ```
    - rigrep (`rg`):
        ```
        sudo apt install ripgrep
        ```
    - `fzf`:
        ```
        sudo apt install 
       ```
4. Optional installation depending on environment:
    - alacritty 
    - i3
    - picom
    - polybar

## Pull down the repository:

Move to your home directory and then clone this project:

```
cd
git clone https://github.com/econmang/.dotfiles.git
```

## Installation:

The install script uses a list of stow-able directories, deletes any existing stows for those symlinks, and then generates the symlinks necessary using `stow`:

```
cd .dotfiles/
./install
```
