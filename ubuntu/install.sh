#!/bin/bash

# Colors for display
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Update packages and install necessary tools
echo -e "${YELLOW}Updating packages...${NC}"
sudo apt update && sudo apt upgrade -y
echo -e "${GREEN}Package update completed! ✔${NC}"

# Installing Nano, SSH, htop, grep, awk, sed, GCC, and Python
echo -e "${YELLOW}Installing Nano, SSH, htop, grep, awk, sed, GCC, and Python...${NC}"
sudo apt install -y nano openssh-server htop grep gawk sed gcc python3 python3-pip
echo -e "${GREEN}Tools installation completed! ✔${NC}"

# Installing Zsh and configuring Oh My Zsh
echo -e "${YELLOW}Installing Zsh and configuring Oh My Zsh...${NC}"
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "${GREEN}Zsh and Oh My Zsh installation completed! ✔${NC}"

# Configuring a dark visual theme for the terminal (Powerlevel10k)
echo -e "${YELLOW}Installing Powerlevel10k theme...${NC}"
sudo apt install -y git fonts-powerline
git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
echo "source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" >> "$HOME/.zshrc"
echo -e "${GREEN}Powerlevel10k theme installed! ✔${NC}"

# Installing nvm to manage Node.js versions
echo -e "${YELLOW}Installing nvm (Node Version Manager)...${NC}"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh" | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
echo -e "${GREEN}nvm installation completed! ✔${NC}"

# Installing the latest stable version of Node.js via nvm
echo -e "${YELLOW}Installing Node.js via nvm...${NC}"
nvm install node  # Installs the latest available version of Node.js
nvm use node      # Uses the installed version of Node.js
echo -e "${GREEN}Node.js installation completed! ✔${NC}"

# Installing Docker & Docker Compose
echo -e "${YELLOW}Installing Docker and Docker Compose...${NC}"
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker "$USER"
echo -e "${GREEN}Docker and Docker Compose installation completed! ✔${NC}"

# Installing Visual Studio Code
echo -e "${YELLOW}Installing Visual Studio Code...${NC}"
sudo snap install --classic code
echo -e "${GREEN}Visual Studio Code installation completed! ✔${NC}"

echo -e "${GREEN}Installation completed. Please open a new terminal or restart your session for the changes to take effect. ✔${NC}"
