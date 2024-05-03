#!/bin/bash

# Colors for display
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Define VS Code user directory based on the operating system
if [ "$(uname -s)" = "Darwin" ]; then
    VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
else
    VSCODE_USER_DIR="$HOME/.config/Code/User"
fi

echo -e "${GREEN}Importing VSCode configuration from repository...${NC}"

# Import settings
if [ -f "./vscode/resources/settings.json" ]; then
    cp "./vscode/resources/settings.json" "$VSCODE_USER_DIR/settings.json"
    echo -e "${GREEN}Settings imported successfully.${NC}"
else
    echo -e "${RED}No settings.json in repository, skipping.${NC}"
fi

# Import keybindings
if [ -f "./vscode/resources/keybindings.json" ]; then
    cp "./vscode/resources/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"
    echo -e "${GREEN}Keybindings imported successfully.${NC}"
else
    echo -e "${RED}No keybindings.json in repository, skipping.${NC}"
fi

# Install extensions
if command -v code >/dev/null; then
    if [ -f "./vscode/resources/extensions.list" ]; then
        xargs -L 1 code --install-extension < "./vscode/resources/extensions.list"
        echo -e "${GREEN}Extensions imported successfully.${NC}"
    else
        echo -e "${RED}No extensions.list found, skipping.${NC}"
    fi
else
    echo -e "${RED}VS Code command line tool 'code' is not available in PATH, cannot install extensions.${NC}"
fi
