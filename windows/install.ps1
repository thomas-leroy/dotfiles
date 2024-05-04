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
                'green'  { Write-Information -MessageData "Color set to green" -InformationAction Continue }
                'red'    { Write-Information -MessageData "Color set to red" -InformationAction Continue }
                'yellow' { Write-Information -MessageData "Color set to yellow" -InformationAction Continue }
                default  { Write-Information -MessageData "Color set to white" -InformationAction Continue }
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
        Write-Information "Chocolatey not found. Installing Chocolatey..."
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
        Write-Information "Installing make utility..."
        choco install make -y
    }
}

# Install or Verify Windows Subsystem for Linux (WSL) and Ubuntu
function Install-WSL {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param ()
    if ($PSCmdlet.ShouldProcess("Installing or verifying Windows Subsystem for Linux (WSL)")) {
        Set-Color -color "yellow"
        Write-Information "Checking for Windows Subsystem for Linux (WSL)..."
        $wsl = wsl --list --quiet
        if ($LASTEXITCODE -eq 0) {
            Set-Color "green"
            $wslVersion = wsl --status | Select-String "Version" | Out-String
            Write-Information "WSL is installed. Version: $($wslVersion.Trim())"
            $ubuntu = wsl -l -v | Select-String "Ubuntu"
            if (-Not $ubuntu) {
                if ($PSCmdlet.ShouldProcess("Ubuntu not found on WSL, prompt to install")) {
                    Set-Color "red"
                    Write-Information "Ubuntu is not installed on WSL. Please install Ubuntu from the Microsoft Store."
                }
            }
        } else {
            if ($PSCmdlet.ShouldProcess("WSL is not installed, initiating installation")) {
                Set-Color "red"
                Write-Information "WSL is not installed. Installing WSL..."
                dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
                Set-Color "yellow"
                Write-Information "Please reboot your system and install Ubuntu from the Microsoft Store to complete the WSL setup."
            }
        }
    }
}

# Install Visual Studio Code using Chocolatey
function Install-VSCode {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param ()
    if ($PSCmdlet.ShouldProcess("Installing Visual Studio Code")) {
        Set-Color -color "yellow"
        Write-Information "Installing Visual Studio Code..."
        choco install vscode -y
        Set-Color "green"
        Write-Information "Visual Studio Code installed successfully!"
    }
}

# Execute the script
Install-Chocolatey
Install-Make
Install-WSL
Install-VSCode

# Reset color
Set-Color "white"
Write-Information "Setup completed successfully!"
