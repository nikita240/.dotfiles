#!/bin/bash

# Absolute path to this script
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in
DOTFILES=$(dirname "$SCRIPT")

#==============
# Delete existing dot folders
#==============

rm -rf ~/.vim
mkdir -p ~/.vim

mkdir -p ~/woven

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $DOTFILES/.vim/autoload ~/.vim/autoload
ln -sf $DOTFILES/woven/.gitconfig ~/woven/.gitconfig
ln -sf $DOTFILES/.antigen.zsh ~/.antigen.zsh
ln -sf $DOTFILES/.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore
ln -sf $DOTFILES/.gitignore-global ~/.gitignore-global
ln -sf $DOTFILES/.vimrc ~/.vimrc
ln -sf $DOTFILES/.zshrc ~/.zshrc

#==============
# If the default shell is bash, make sure it will just launch zsh
#==============

sed -i '1s;^;export SHELL=/usr/bin/zsh\nexec /usr/bin/zsh\n;' ~/.bashrc

#==============
# Install vim plugins
#==============

vim +'PlugInstall --sync' +qa

echo "****************************************************"
echo "Run chsh -s /usr/bin/zsh to change your shell to zsh"
echo "****************************************************"