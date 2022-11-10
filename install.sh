#!/bin/bash

# Absolute path to this script
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in
DOTFILES=$(dirname "$SCRIPT")

#==============
# Delete existing dot folders
#==============

rm -rf ~/.vim

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $DOTFILES/.vim ~/.vim
ln -sf $DOTFILES/woven/.gitconfig ~/woven/.gitconfig
ln -sf $DOTFILES/.antigen.zsh ~/.antigen.zsh
ln -sf $DOTFILES/.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore
ln -sf $DOTFILES/.gitignore-global ~/.gitignore-global
ln -sf $DOTFILES/.vimrc ~/.vimrc
ln -sf $DOTFILES/.zshrc ~/.zshrc
