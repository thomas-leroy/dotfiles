#!/bin/bash

# Update packages and install necessary tools
echo -e "\e[33mUpdating packages...\e[0m"
sudo apt update && sudo apt upgrade -y
echo -e "\e[32mPackage update completed! ✔\e[0m"

# Installing Zsh and configuring Oh My Zsh
echo -e "\e[33mInstalling Zsh and configuring Oh My Zsh...\e[0m"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "\e[32mZsh and Oh My Zsh installation completed! ✔\e[0m"

# Configuring a dark visual theme for the terminal (Powerlevel10k)
echo -e "\e[33mInstalling Powerlevel10k theme...\e[0m"
sudo apt install -y git fonts-powerline
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
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
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
echo -e "\e[32mDocker and Docker Compose installation completed! ✔\e[0m"

# Installing Visual Studio Code
echo -e "\e[33mInstalling Visual Studio Code...\e[0m"
sudo snap install --classic code
echo -e "\e[32mVisual Studio Code installation completed! ✔\e[0m"

echo -e "\e[32mInstallation completed. Please open a new terminal or restart your session for the changes to take effect. ✔\e[0m"
