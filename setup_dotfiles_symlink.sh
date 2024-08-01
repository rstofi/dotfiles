#!/bin/bash

DOTFILES_DIR=~/dotfiles

# Create symlinks
ln -sf $DOTFILES_DIR/vim/vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/tmux/tmux.conf ~/.tmux.conf
