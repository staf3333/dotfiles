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

# PowerShell profiles (both Windows PowerShell and PowerShell Core)
# Uses the actual Documents path (handles OneDrive redirection automatically)
$ProfileSource = "$DotfilesDir\powershell\Microsoft.PowerShell_profile.ps1"
$DocsDir = [Environment]::GetFolderPath("MyDocuments")
$ProfilePaths = @(
    "$DocsDir\WindowsPowerShell\Microsoft.PowerShell_profile.ps1",
    "$DocsDir\PowerShell\Microsoft.PowerShell_profile.ps1"
)
foreach ($ProfileTarget in $ProfilePaths) {
    $ProfileDir = Split-Path -Parent $ProfileTarget
    if (!(Test-Path $ProfileDir)) { New-Item -ItemType Directory -Path $ProfileDir -Force | Out-Null }
    if (Test-Path $ProfileTarget) {
        Write-Host "Backing up existing profile to $ProfileTarget.bak"
        Copy-Item $ProfileTarget "$ProfileTarget.bak" -Force
        Remove-Item $ProfileTarget -Force
    }
    New-Item -ItemType SymbolicLink -Path $ProfileTarget -Target $ProfileSource -Force
    Write-Host "✔ Profile linked: $ProfileTarget"
}

# Neovim dependencies
Write-Host ""
Write-Host "Installing Neovim dependencies..."

# tree-sitter CLI (needed to compile treesitter parsers)
if (!(Get-Command tree-sitter -ErrorAction SilentlyContinue)) {
    if (Get-Command npm -ErrorAction SilentlyContinue) {
        npm install -g tree-sitter-cli
        Write-Host "✔ tree-sitter-cli installed"
    } else {
        Write-Host "⚠ npm not found — install tree-sitter-cli manually: npm install -g tree-sitter-cli"
    }
} else {
    Write-Host "✔ tree-sitter-cli already installed"
}

# Sync Lazy plugins and install treesitter parsers
if (Get-Command nvim -ErrorAction SilentlyContinue) {
    Write-Host "Syncing Neovim plugins..."
    nvim --headless "+Lazy! sync" +qa 2>&1 | Out-Null
    Write-Host "✔ Neovim plugins synced"
} else {
    Write-Host "⚠ nvim not found — install Neovim 0.11+ and run :Lazy sync manually"
}

# Neovim dependencies
Write-Host ""
Write-Host "Installing Neovim dependencies..."

# tree-sitter CLI (needed to compile treesitter parsers)
if (!(Get-Command tree-sitter -ErrorAction SilentlyContinue)) {
    if (Get-Command npm -ErrorAction SilentlyContinue) {
        npm install -g tree-sitter-cli
        Write-Host "✔ tree-sitter-cli installed"
    } else {
        Write-Host "⚠ npm not found — install tree-sitter-cli manually: npm install -g tree-sitter-cli"
    }
} else {
    Write-Host "✔ tree-sitter-cli already installed"
}

# Sync Lazy plugins and install treesitter parsers
if (Get-Command nvim -ErrorAction SilentlyContinue) {
    Write-Host "Syncing Neovim plugins..."
    nvim --headless "+Lazy! sync" +qa 2>&1 | Out-Null
    Write-Host "✔ Neovim plugins synced"
} else {
    Write-Host "⚠ nvim not found — install Neovim 0.11+ and run :Lazy sync manually"
}

Write-Host ""
Write-Host "Note: For tmux and zsh, run install.sh inside WSL."
Write-Host ""
Write-Host "Done! Restart your terminal."
