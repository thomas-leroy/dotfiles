#!/bin/bash

# Colors for display
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Check if Homebrew is installed, otherwise install it
if ! command -v brew &>/dev/null; then
    echo -e "${YELLOW}Homebrew is not installed. Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo -e "${GREEN}Homebrew installation completed! ✔${NC}"
else
    echo -e "${GREEN}Homebrew is already installed. ✔${NC}"
fi

# Updating Homebrew
echo -e "${YELLOW}Updating Homebrew...${NC}"
brew update
echo -e "${GREEN}Homebrew update completed! ✔${NC}"

# Installing Warp terminal
echo -e "${YELLOW}Installing Warp terminal...${NC}"
brew install --cask warp
echo -e "${GREEN}Warp terminal installation completed! ✔${NC}"

# Installing Zsh and Oh My Zsh
echo -e "${YELLOW}Installing Zsh and Oh My Zsh...${NC}"
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

# Installing nvm to manage Node.js versions
echo -e "${YELLOW}Installing nvm (Node Version Manager)...${NC}"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
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
brew install --cask docker
brew install docker-compose
echo -e "${GREEN}Docker and Docker Compose installation completed! ✔${NC}"

# Installing Visual Studio Code
echo -e "${YELLOW}Installing Visual Studio Code...${NC}"
brew install --cask visual-studio-code
echo -e "${GREEN}Visual Studio Code installation completed! ✔${NC}"

echo -e "${GREEN}Installation completed. Please open a new terminal for the changes to take effect. ✔${NC}"
