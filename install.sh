#!/bin/bash
# Install script for dotfiles (Mac/Linux)
# Creates symlinks from dotfiles repo to their expected locations

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Neovim
if [ -e ~/.config/nvim ]; then
  echo "Backing up existing nvim config to ~/.config/nvim.bak"
  mv ~/.config/nvim ~/.config/nvim.bak
fi
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/nvim/.config/nvim" ~/.config/nvim
echo "✔ Neovim config linked"

# Tmux
if [ -e ~/.tmux.conf ]; then
  echo "Backing up existing tmux config to ~/.tmux.conf.bak"
  mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" ~/.tmux.conf
echo "✔ Tmux config linked"

# Zsh
if [ -e ~/.zshrc ]; then
  echo "Backing up existing zshrc to ~/.zshrc.bak"
  mv ~/.zshrc ~/.zshrc.bak
fi
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
echo "✔ Zshrc linked"

# Install TPM if not present
if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo ""
echo "Done! Restart your terminal and run 'Ctrl-a I' in tmux to install plugins."
