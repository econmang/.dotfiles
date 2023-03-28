# Instructions

### Pull down the repository:

Move to your home directory and then clone this project:

```
cd
git clone https://github.com/econmang/.dotfiles.git
```

### Installation:

The install script uses a list of stow-able directories, deletes any existing stows for those symlinks, and then generates the symlinks necessary using `stow`:

```
cd .dotfiles/
./install
```
