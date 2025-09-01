#!/bin/bash

# Colors for display
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Installing 'z' for quick directory navigation...${NC}"
    
# Clone z repository
git clone https://github.com/rupa/z.git "$HOME/.z-install"

# Add z to .zshrc
echo -e "${YELLOW}Configuring z in .zshrc...${NC}"
{
    echo "# z configuration"
    echo "source $HOME/.z-install/z.sh"
    echo "export _Z_DATA=$HOME/.zdata"
} >> "$HOME/.zshrc"

echo -e "${GREEN}z has been successfully installed and configured. ✔${NC}"
