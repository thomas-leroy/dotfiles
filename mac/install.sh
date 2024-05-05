#!/bin/bash

# Colors for display
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Ensure temporary directory exists and is empty
mkdir -p ./tmp/
cd ./tmp/

# Check if Homebrew is installed, otherwise install it
if ! command -v brew &>/dev/null; then
    echo -e "${YELLOW}Homebrew is not installed. Installing Homebrew...${NC}"
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o ./tmp/homebrew_install.sh
    echo "Homebrew installer script downloaded. Please inspect the script before running it."
    read -p "Press enter to continue if the script is okay."
    /bin/bash ./tmp/homebrew_install.sh
    rm ./tmp/homebrew_install.sh
    echo -e "${GREEN}Homebrew installation completed! ✔${NC}"
else
    echo -e "${GREEN}Homebrew is already installed. ✔${NC}"
fi

# Updating Homebrew
echo -e "${YELLOW}Updating Homebrew...${NC}"
brew update
echo -e "${GREEN}Homebrew update completed! ✔${NC}"

# Installing necessary tools
echo -e "${YELLOW}Installing Nano, SSH, htop, grep/awk/sed, GCC, and Python...${NC}"
brew install nano openssh htop grep gawk gcc python
echo -e "${GREEN}Tools installation completed! ✔${NC}"

# Ask the user to choose their default editor
echo -e "${YELLOW}Choose your default editor (vim, nano, emacs, etc.). Default is vim.${NC}"
read -p "Enter your editor choice (leave empty for default): " editor_choice
editor_choice=${editor_choice:-vim}  # Set default to vim if empty

# Check if the chosen editor is installed, install if not
if ! command -v $editor_choice &>/dev/null; then
    echo -e "${YELLOW}$editor_choice is not installed. Installing $editor_choice...${NC}"
    brew install $editor_choice
    echo -e "${GREEN}$editor_choice installation completed! ✔${NC}"
else
    echo -e "${GREEN}$editor_choice is already installed. ✔${NC}"
fi

# Set the default editor environment variable for zsh
export EDITOR=$editor_choice
echo "export EDITOR=$editor_choice" >> ~/.zshrc

# Installing Warp terminal
echo -e "${YELLOW}Installing Warp terminal...${NC}"
brew install --cask warp
echo -e "${GREEN}Warp terminal installation completed! ✔${NC}"

# Installing Zsh and Oh My Zsh
echo -e "${YELLOW}Installing Zsh and Oh My Zsh...${NC}"
brew install zsh
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o ./tmp/ohmyzsh_install.sh
echo "Script downloaded. Please inspect the script before running it."
read -p "Press enter to continue if the script is okay."
sh ./tmp/ohmyzsh_install.sh
rm ./tmp/ohmyzsh_install.sh
echo -e "${GREEN}Zsh and Oh My Zsh installation completed! ✔${NC}"

# Setting default shell to Zsh
if [ ! "$SHELL" = "/bin/zsh" ]; then
    echo -e "${YELLOW}Setting Zsh as the default shell...${NC}"
    chsh -s /bin/zsh
    echo -e "${GREEN}Default shell set to Zsh! ✔${NC}"
fi

# Configuring a dark visual theme for the terminal (Powerlevel10k)
echo -e "${YELLOW}Installing Powerlevel10k theme for a dark visual...${NC}"
brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
echo -e "${GREEN}Powerlevel10k theme installed! ✔${NC}"

# Downloading the latest nvm install script
echo -e "${YELLOW}Downloading the latest nvm (Node Version Manager) install script...${NC}"
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh -o ./tmp/nvm_install.sh
echo -e "${YELLOW}Latest nvm install script downloaded. Please inspect the script before running it.${NC}"
read -p "Press enter to continue if the script is okay."

# Installing nvm from the downloaded script
echo -e "${YELLOW}Installing nvm from the downloaded script...${NC}"
sh ./tmp/nvm_install.sh
rm ./tmp/nvm_install.sh  # Cleaning up the script after installation
echo -e "${GREEN}nvm installation completed! ✔${NC}"

# Installing the latest stable version of Node.js via nvm
echo -e "${YELLOW}Installing Node.js via nvm...${NC}"
nvm install node  # Installs the latest available version of Node.js
nvm use node      # Uses the installed version of Node.js
echo -e "${GREEN}Node.js installation completed! ✔${NC}"

# Installing Docker & Docker Compose
echo -e "${YELLOW}Installing Docker and Docker Compose...${NC}"
brew install --cask docker
brew install docker-compose
echo -e "${GREEN}Docker and Docker Compose installation completed! ✔${NC}"

# Installing Visual Studio Code
echo -e "${YELLOW}Installing Visual Studio Code...${NC}"
brew install --cask visual-studio-code
echo -e "${GREEN}Visual Studio Code installation completed! ✔${NC}"

#Delete temporary folder
rm -rf ./tmp/

echo -e "${GREEN}Installation completed. Please open a new terminal for the changes to take effect. ✔${NC}"
