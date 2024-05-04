# Define color constants for output
function Set-Color {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String]$color
    )
    Process {
        if ($PSCmdlet.ShouldProcess("Setting terminal color to $color")) {
            switch ($color) {
                'green'  { Write-Host -ForegroundColor Green }
                'red'    { Write-Host -ForegroundColor Red }
                'yellow' { Write-Host -ForegroundColor Yellow }
                default  { Write-Host -ForegroundColor White }
            }
        }
    }
}

# Install Chocolatey if not already installed (Required to install 'make' and Visual Studio Code)
function Install-Chocolatey {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param ()
    if ($PSCmdlet.ShouldProcess("Installing Chocolatey")) {
        Set-Color -color "yellow"
        Write-Host "Chocolatey not found. Installing Chocolatey..."
        $chocoInstallScriptUrl = 'https://chocolatey.org/install.ps1'
        $chocoInstallScriptPath = Join-Path -Path $env:TEMP -ChildPath "chocoInstall.ps1"
        Invoke-WebRequest -Uri $chocoInstallScriptUrl -OutFile $chocoInstallScriptPath
        Set-ExecutionPolicy Bypass -Scope Process -Force
        & $chocoInstallScriptPath
        Remove-Item $chocoInstallScriptPath -Force
    }
}

# Install make using Chocolatey
function Install-Make {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param ()
    if ($PSCmdlet.ShouldProcess("Installing make utility via Chocolatey")) {
        Set-Color -color "yellow"
        Write-Host "Installing make utility..."
        choco install make -y
    }
}

# Check if WSL is installed and handle installation processes
function Check-And-Install-WSL {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param ()
    Set-Color -color "yellow"
    Write-Host "Checking for Windows Subsystem for Linux (WSL)..."
    $wsl = wsl --list --quiet
    if ($LASTEXITCODE -eq 0) {
        if ($PSCmdlet.ShouldProcess("WSL detected, checking for Ubuntu")) {
            Set-Color "green"
            $wslVersion = wsl --status | Select-String "Version" | Out-String
            Write-Host "WSL is installed. Version:" $wslVersion.Trim()

            $ubuntu = wsl -l -v | Select-String "Ubuntu"
            if (-Not $ubuntu) {
                if ($PSCmdlet.ShouldProcess("Ubuntu not found, prompting to install")) {
                    Set-Color "red"
                    Write-Host "Ubuntu is not installed on WSL. Please install Ubuntu from the Microsoft Store."
                }
            }
        }
    } else {
        if ($PSCmdlet.ShouldProcess("WSL is not installed, initiating installation")) {
            Set-Color "red"
            Write-Host "WSL is not installed. Installing WSL..."
            dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
            Set-Color "yellow"
            Write-Host "Please reboot your system and install Ubuntu from the Microsoft Store to complete the WSL setup."
        }
    }
}

# Install Visual Studio Code using Chocolatey
function Install-VSCode {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param ()
    if ($PSCmdlet.ShouldProcess("Installing Visual Studio Code")) {
        Set-Color -color "yellow"
        Write-Host "Installing Visual Studio Code..."
        choco install vscode -y
        Set-Color "green"
        Write-Host "Visual Studio Code installed successfully!"
    }
}

# Execute the script
Install-Chocolatey
Install-Make
Check-And-Install-WSL
Install-VSCode

# Reset color
Set-Color "white"
Write-Host "Setup completed successfully!"
