# Copilot CLI Custom Instructions

This is a dotfiles repo. When the user says "sync dotfiles" or "push dotfiles":
1. `cd ~/dotfiles`
2. `git add -A`
3. Show a brief summary of what changed
4. Commit with a descriptive message
5. Push to origin

When the user says "pull dotfiles":
1. `cd ~/dotfiles && git pull`

When the user says "install dotfiles":
1. `cd ~/dotfiles && ./install.sh`

The dotfiles structure:
- `nvim/.config/nvim/` — Neovim config (symlinked to ~/.config/nvim)
- `tmux/.tmux.conf` — Tmux config (symlinked to ~/.tmux.conf)
- `zsh/.zshrc` — Zsh config (symlinked to ~/.zshrc)
