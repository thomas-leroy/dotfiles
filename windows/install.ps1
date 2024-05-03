# Define color constants for output
function Set-Color {
    param (
        [String]$color
    )
    if ($color -eq "green") {
        Write-Host -ForegroundColor Green
    } elseif ($color -eq "red") {
        Write-Host -ForegroundColor Red
    } elseif ($color -eq "yellow") {
        Write-Host -ForegroundColor Yellow
    } else {
        Write-Host -ForegroundColor White
    }
}

# Install Chocolatey if not already installed (Required to install 'make' and Visual Studio Code)
if (-Not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-Color "yellow"
    Write-Host "Chocolatey not found. Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install make using Chocolatey
Set-Color "yellow"
Write-Host "Installing make utility..."
choco install make -y

# Check if WSL is installed
Set-Color "yellow"
Write-Host "Checking for Windows Subsystem for Linux (WSL)..."
$wsl = wsl --list --quiet
if ($LASTEXITCODE -eq 0) {
    # WSL is installed, get version
    Set-Color "green"
    $wslVersion = wsl --status | Select-String "Version" | Out-String
    Write-Host "WSL is installed. Version:" $wslVersion.Trim()
    
    # Check for Ubuntu installation in WSL
    $ubuntu = wsl -l -v | Select-String "Ubuntu"
    if (-Not $ubuntu) {
        Set-Color "red"
        Write-Host "Ubuntu is not installed on WSL. Please install Ubuntu from the Microsoft Store."
    }
} else {
    # WSL is not installed, install WSL
    Set-Color "red"
    Write-Host "WSL is not installed. Installing WSL..."
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    # Inform the user to reboot and install Ubuntu from the store
    Set-Color "yellow"
    Write-Host "Please reboot your system and install Ubuntu from the Microsoft Store to complete the WSL setup."
}

# Install Visual Studio Code using Chocolatey
Set-Color "yellow"
Write-Host "Installing Visual Studio Code..."
choco install vscode -y

Set-Color "green"
Write-Host "Setup completed successfully!"

# Reset color
Set-Color "white"
