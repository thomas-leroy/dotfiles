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

echo -e "${GREEN}Exporting VSCode configuration to repository...${NC}"

# Export settings
if [ -f "$VSCODE_USER_DIR/settings.json" ]; then
    cp "$VSCODE_USER_DIR/settings.json" "./vscode/resources/settings.json"
    echo -e "${GREEN}Settings exported successfully.${NC}"
else
    echo -e "${RED}No settings.json found, skipping.${NC}"
fi

# Export keybindings
if [ -f "$VSCODE_USER_DIR/keybindings.json" ]; then
    cp "$VSCODE_USER_DIR/keybindings.json" "./vscode/resources/keybindings.json"
    echo -e "${GREEN}Keybindings exported successfully.${NC}"
else
    echo -e "${RED}No keybindings.json found, skipping.${NC}"
fi

# Export list of extensions
if command -v code >/dev/null; then
    code --list-extensions > "./vscode/resources/extensions.list"
    echo -e "${GREEN}Extensions list exported successfully.${NC}"
else
    echo -e "${RED}VS Code command line tool 'code' is not available in PATH, cannot export extensions list.${NC}"
fi
