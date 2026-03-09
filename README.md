# Dotfiles

My personal config files for neovim, tmux, and zsh.

## Structure

```
dotfiles/
├── nvim/.config/nvim/   # Neovim config
├── tmux/.tmux.conf      # Tmux config
├── zsh/.zshrc           # Zsh config
├── install.sh           # Mac/Linux installer
└── install.ps1          # Windows installer (nvim only, use WSL for tmux/zsh)
```

## Setup on a new machine

### Mac/Linux
```bash
git clone https://github.com/staf3333/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### Windows
```powershell
git clone https://github.com/staf3333/dotfiles.git $HOME\dotfiles
cd $HOME\dotfiles
# Run as Administrator
.\install.ps1
```

## After install
- Open tmux and press `Ctrl-a I` to install tmux plugins
- Open nvim and let Lazy sync plugins automatically
