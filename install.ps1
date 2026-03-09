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

# Windows Terminal
$WTTarget = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
if (Test-Path $WTTarget) {
    Write-Host "Backing up existing Windows Terminal settings to $WTTarget.bak"
    Copy-Item $WTTarget "$WTTarget.bak" -Force
    Remove-Item $WTTarget -Force
}
New-Item -ItemType SymbolicLink -Path $WTTarget -Target "$DotfilesDir\windows-terminal\settings.json" -Force
Write-Host "✔ Windows Terminal settings linked"

# PowerShell profile
$ProfileTarget = $PROFILE
$ProfileDir = Split-Path -Parent $ProfileTarget
if (!(Test-Path $ProfileDir)) { New-Item -ItemType Directory -Path $ProfileDir -Force | Out-Null }
if (Test-Path $ProfileTarget) {
    Write-Host "Backing up existing PowerShell profile to $ProfileTarget.bak"
    Copy-Item $ProfileTarget "$ProfileTarget.bak" -Force
    Remove-Item $ProfileTarget -Force
}
New-Item -ItemType SymbolicLink -Path $ProfileTarget -Target "$DotfilesDir\powershell\Microsoft.PowerShell_profile.ps1" -Force
Write-Host "✔ PowerShell profile linked"

Write-Host ""
Write-Host "Note: For tmux and zsh, run install.sh inside WSL."
Write-Host ""
Write-Host "Done! Restart your terminal."
