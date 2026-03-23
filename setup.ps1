# Stop on errors
$ErrorActionPreference = "Stop"

# Get dotfiles repo root (this script's location)
$dotfiles = $PSScriptRoot

# Targets
$nvimTarget = "$env:LOCALAPPDATA\nvim"
$weztermTarget = "$env:USERPROFILE\.config\wezterm"

# Sources
$nvimSource = Join-Path $dotfiles "nvim"
$weztermSource = Join-Path $dotfiles "wezterm"

function Create-Symlink($target, $source) {
    if (Test-Path $target) {
        Write-Host "Removing existing: $target"
        Remove-Item $target -Recurse -Force
    }

    Write-Host "Creating symlink:"
    Write-Host "  $target -> $source"

    New-Item -ItemType SymbolicLink -Path $target -Target $source
}

# Ensure .config directory exists
$configDir = "$env:USERPROFILE\.config"
if (!(Test-Path $configDir)) {
    New-Item -ItemType Directory -Path $configDir | Out-Null
}

# Create links
Create-Symlink $nvimTarget $nvimSource
Create-Symlink $weztermTarget $weztermSource

Write-Host "`n✅ Dotfiles setup complete!"
