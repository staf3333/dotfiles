# Install script for dotfiles (Windows PowerShell)
# Creates symlinks from dotfiles repo to their expected locations
# Run as Administrator

$DotfilesDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Installing dotfiles from $DotfilesDir"

# Neovim
$NvimTarget = "$env:LOCALAPPDATA\nvim"
if (Test-Path $NvimTarget) {
    Write-Host "Backing up existing nvim config to $NvimTarget.bak"
    Move-Item $NvimTarget "$NvimTarget.bak" -Force
}
New-Item -ItemType SymbolicLink -Path $NvimTarget -Target "$DotfilesDir\nvim\.config\nvim" -Force
Write-Host "✔ Neovim config linked"

# Tmux (if using WSL, tmux config goes to ~/.tmux.conf via WSL install script)
Write-Host ""
Write-Host "Note: For tmux and zsh, run install.sh inside WSL."
Write-Host ""
Write-Host "Done! Restart your terminal."
