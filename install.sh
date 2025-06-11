#!/bin/bash

# Absolute path to this script
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in
DOTFILES=$(dirname "$SCRIPT")

#==============
# Delete existing dot folders
#==============

# Remove existing directories before creating symlinks
rm -rf ~/.vim
rm -rf ~/.config/niri
rm -rf ~/.config/mako
rm -rf ~/.config/waybar
rm -rf ~/.config/alacritty

# Create .config directory if it doesn't exist
mkdir -p ~/.vim
mkdir -p ~/woven
mkdir -p ~/.config

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $DOTFILES/.vim/autoload ~/.vim/autoload
ln -sf $DOTFILES/code/.gitconfig ~/code/.gitconfig
ln -sf $DOTFILES/.antigen.zsh ~/.antigen.zsh
ln -sf $DOTFILES/.gitconfig ~/.gitconfig
ln -sf $DOTFILES/.gitignore ~/.gitignore
ln -sf $DOTFILES/.gitignore-global ~/.gitignore-global
ln -sf $DOTFILES/.vimrc ~/.vimrc
ln -sf $DOTFILES/.zshrc ~/.zshrc
ln -sf $DOTFILES/.config/niri ~/.config/niri
ln -sf $DOTFILES/.config/mako ~/.config/mako
ln -sf $DOTFILES/.config/waybar ~/.config/waybar
ln -sf $DOTFILES/.config/alacritty ~/.config/alacritty

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
