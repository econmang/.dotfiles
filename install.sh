#!/usr/bin/env zsh

# Set the folders to stow
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="alacritty,i3,nvim,zsh"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

STOW_FOLDERS=$STOW_FOLDERS DOTFILES=$DOTFILES #$DOTFILES/install

echo "stowing folders: $STOW_FOLDERS"
echo "dotfiles folder: $DOTFILES"

pushd $DOTIFLES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    #stow -D $folder
    stow $folder
done
popd

