#!/bin/bash

# Check if Homebrew is installed, otherwise install it
if ! command -v brew &>/dev/null; then
    echo -e "\e[33mHomebrew is not installed. Installing Homebrew...\e[0m"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo -e "\e[32mHomebrew installation completed! ✔\e[0m"
else
    echo -e "\e[32mHomebrew is already installed. ✔\e[0m"
fi

# Updating Homebrew
echo -e "\e[33mUpdating Homebrew...\e[0m"
brew update
echo -e "\e[32mHomebrew update completed! ✔\e[0m"

# Installing Warp terminal
echo -e "\e[33mInstalling Warp terminal...\e[0m"
brew install --cask warp
echo -e "\e[32mWarp terminal installation completed! ✔\e[0m"

# Installing Zsh and Oh My Zsh
echo -e "\e[33mInstalling Zsh and Oh My Zsh...\e[0m"
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "\e[32mZsh and Oh My Zsh installation completed! ✔\e[0m"

# Setting default shell to Zsh
if [ ! "$SHELL" = "/bin/zsh" ]; then
    echo -e "\e[33mSetting Zsh as the default shell...\e[0m"
    chsh -s /bin/zsh
    echo -e "\e[32mDefault shell set to Zsh! ✔\e[0m"
fi

# Configuring a dark visual theme for the terminal (Powerlevel10k)
echo -e "\e[33mInstalling Powerlevel10k theme for a dark visual...\e[0m"
brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
echo -e "\e[32mPowerlevel10k theme installed! ✔\e[0m"

# Installing nvm to manage Node.js versions
echo -e "\e[33mInstalling nvm (Node Version Manager)...\e[0m"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
echo -e "\e[32mnvm installation completed! ✔\e[0m"

# Installing the latest stable version of Node.js via nvm
echo -e "\e[33mInstalling Node.js via nvm...\e[0m"
nvm install node  # Installs the latest available version of Node.js
nvm use node      # Uses the installed version of Node.js
echo -e "\e[32mNode.js installation completed! ✔\e[0m"

# Installing Docker & Docker Compose
echo -e "\e[33mInstalling Docker and Docker Compose...\e[0m"
brew install --cask docker
brew install docker-compose
echo -e "\e[32mDocker and Docker Compose installation completed! ✔\e[0m"

# Installing Visual Studio Code
echo -e "\e[33mInstalling Visual Studio Code...\e[0m"
brew install --cask visual-studio-code
echo -e "\e[32mVisual Studio Code installation completed! ✔\e[0m"

echo -e "\e[32mInstallation completed. Please open a new terminal for the changes to take effect. ✔\e[0m"
