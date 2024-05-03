#!/bin/bash

# Colors for display
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# Configuration of the directory for global npm packages
echo -e "${BLUE}Configuring directory for global npm packages...${NC}"
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
echo -e "${GREEN}Directory configuration completed! ✔${NC}"

# Updating Node.js and npm via nvm (to be installed beforehand)
echo -e "${YELLOW}Updating Node.js...${NC}"
if nvm install node --reinstall-packages-from=node; then
    echo -e "${GREEN}Node.js update completed successfully! ✔${NC}"
else
    echo -e "${RED}Node.js update failed! ✖${NC}"
fi

# Installing http-server to test projects
echo -e "${YELLOW}Installing http-server...${NC}"
if npm install -g http-server; then
    echo -e "${GREEN}http-server installation completed successfully! ✔${NC}"
else
    echo -e "${RED}http-server installation failed! ✖${NC}"
fi

echo -e "${GREEN}Update and installation processes are complete! ✔${NC}"
