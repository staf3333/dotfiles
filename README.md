# Dotfiles

My personal config files for neovim, tmux, zsh, Windows Terminal, and PowerShell.

## Structure

```
dotfiles/
├── nvim/.config/nvim/       # Neovim config
├── windows-terminal/        # Windows Terminal settings
├── powershell/              # PowerShell profile
├── tmux/.tmux.conf          # Tmux config
├── zsh/.zshrc               # Zsh config
├── install.sh               # Mac/Linux installer
└── install.ps1              # Windows installer
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
- Run `:MasonInstall roslyn lua-language-server pyright` in nvim for LSP support
- Run `:Copilot auth` in nvim to sign in to GitHub Copilot

## Windows Terminal Keybindings

### Pane Management (tmux-style)

| Shortcut | Action |
|---|---|
| `Alt+-` | Split pane horizontal |
| `Alt+\|` | Split pane vertical |
| `Alt+Shift+D` | Auto split (duplicate) |
| `Alt+h` | Focus pane left |
| `Alt+j` | Focus pane down |
| `Alt+k` | Focus pane up |
| `Alt+l` | Focus pane right |
| `Alt+Shift+h` | Resize pane left |
| `Alt+Shift+j` | Resize pane down |
| `Alt+Shift+k` | Resize pane up |
| `Alt+Shift+l` | Resize pane right |

### Tabs

| Shortcut | Action |
|---|---|
| `Alt+n` | Next tab |
| `Alt+p` | Previous tab |
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+W` | Close tab/pane |

### General

| Shortcut | Action |
|---|---|
| `Ctrl+C` | Copy |
| `Ctrl+V` | Paste |
| `Ctrl+Shift+F` | Find |
| `Ctrl+Shift+P` | Command palette |

## PowerShell Aliases

| Command | Action |
|---|---|
| `apihub` | cd to ApiHub, open nvim in src |
| `nvimconfig` | cd to dotfiles, open nvim config |

## Tmux Keybindings

Prefix is `Ctrl+A` (not default Ctrl+B).

| Shortcut | Action |
|---|---|
| `Ctrl+A -` | Split horizontal |
| `Ctrl+A \|` | Split vertical |
| `Ctrl+A h/j/k/l` | Move between panes |
| `Ctrl+A I` | Install TPM plugins |
