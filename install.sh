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

# Lazygit
LAZYGIT_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/lazygit"
mkdir -p "$LAZYGIT_CONFIG_DIR"
if [ -e "$LAZYGIT_CONFIG_DIR/config.yml" ]; then
  echo "Backing up existing lazygit config to $LAZYGIT_CONFIG_DIR/config.yml.bak"
  mv "$LAZYGIT_CONFIG_DIR/config.yml" "$LAZYGIT_CONFIG_DIR/config.yml.bak"
fi
ln -sf "$DOTFILES_DIR/lazygit/config.yml" "$LAZYGIT_CONFIG_DIR/config.yml"
if [ "$(uname)" = "Darwin" ]; then
  ln -sf "$DOTFILES_DIR/lazygit/config-darwin.yml" "$LAZYGIT_CONFIG_DIR/config-darwin.yml"
  echo "✔ Lazygit config linked (with macOS nvim-remote override)"
  echo "  Add to your .zshrc:  export LG_CONFIG_FILE=\"\$HOME/.config/lazygit/config.yml,\$HOME/.config/lazygit/config-darwin.yml\""
else
  echo "✔ Lazygit config linked"
fi

# Install TPM if not present
if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Neovim dependencies
echo ""
echo "Installing Neovim dependencies..."

# tree-sitter CLI (needed to compile treesitter parsers)
if ! command -v tree-sitter &> /dev/null; then
  if command -v npm &> /dev/null; then
    npm install -g tree-sitter-cli
    echo "✔ tree-sitter-cli installed"
  else
    echo "⚠ npm not found — install tree-sitter-cli manually: npm install -g tree-sitter-cli"
  fi
else
  echo "✔ tree-sitter-cli already installed"
fi

# Sync Lazy plugins and install treesitter parsers
if command -v nvim &> /dev/null; then
  echo "Syncing Neovim plugins..."
  nvim --headless "+Lazy! sync" +qa 2>/dev/null
  echo "✔ Neovim plugins synced"
else
  echo "⚠ nvim not found — install Neovim 0.11+ and run :Lazy sync manually"
fi

echo ""
echo "Done! Restart your terminal and run 'Ctrl-a I' in tmux to install plugins."
