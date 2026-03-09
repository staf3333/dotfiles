Import-Module posh-git
Import-Module Terminal-Icons

# TODO: change this to a theme that suits you (below uses jandedobbeleer theme)
try {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
} catch {
    Write-Warning "oh-my-posh init failed: $_"
}
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function New-CopilotPane {
    & wt --window 0 split-pane -H `
        -p "Developer PowerShell for VS 18" `
        --startingDirectory $PWD `
        copilot --add-dir . --allow-all-tools
}

function apihub { Set-Location "C:\OneBranch\AAPT\Antares\ApiHub"; nvim src }
function nvimconfig { Set-Location "$HOME\dotfiles"; nvim nvim/.config/nvim }
