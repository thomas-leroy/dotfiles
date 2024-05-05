#!/bin/bash

# Colors for display
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Ensure temporary directory exists and is empty
mkdir -p ./tmp/
cd ./tmp/

# Update packages and install necessary tools
echo -e "${YELLOW}Updating packages...${NC}"
sudo apt update && sudo apt upgrade -y
echo -e "${GREEN}Package update completed! ✔${NC}"

# Installing Nano, SSH, htop, grep, awk, sed, GCC, and Python
echo -e "${YELLOW}Installing Nano, SSH, htop, grep, awk, sed, GCC, and Python...${NC}"
sudo apt install -y nano openssh-server htop grep gawk sed gcc python3 python3-pip
echo -e "${GREEN}Tools installation completed! ✔${NC}"

# Ask the user to choose their default editor
echo -e "${YELLOW}Choose your default editor (vim, nano, emacs, etc.). Default is vim:${NC}"
read -p "Enter your editor choice (leave empty for default): " editor_choice
editor_choice="${editor_choice:-vim}"  # Set default to vim if empty

# Check if the chosen editor is installed, install if not
if ! command -v "$editor_choice" &>/dev/null; then
    echo -e "${YELLOW}$editor_choice is not installed. Installing $editor_choice...${NC}"
    sudo apt install -y "$editor_choice"
    echo -e "${GREEN}$editor_choice installation completed! ✔${NC}"
else
    echo -e "${GREEN}$editor_choice is already installed. ✔${NC}"
fi

# Set the default editor environment variable for zsh
export EDITOR=$editor_choice
echo "export EDITOR=$editor_choice" >> ~/.zshrc

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
echo -e "${YELLOW}Downloading nvm (Node Version Manager) install script...${NC}"
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh -o ./tmp/nvm_install.sh
echo "nvm install script downloaded. Please inspect the script before running it."
read -p "Press enter to continue if the script is okay."
sh ./tmp/nvm_install.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
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

#Delete temporary folder
rm -rf ./tmp/

echo -e "${GREEN}Installation completed. Please open a new terminal or restart your session for the changes to take effect. ✔${NC}"
