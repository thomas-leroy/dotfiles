#!/bin/bash

# Colors for display
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color



# Install pnpm if not present
if ! command -v pnpm &> /dev/null; then
    echo -e "${YELLOW}pnpm not found, installing...${NC}"
    npm install -g pnpm
    echo -e "${GREEN}pnpm installed! ✔${NC}"
fi

# Configure global directory for pnpm
echo -e "${BLUE}Configuring global directory for pnpm...${NC}"
pnpm config set prefix ~/.pnpm-global
export PATH=~/.pnpm-global/bin:$PATH
echo -e "${GREEN}Global directory configuration completed! ✔${NC}"

# Updating Node.js and npm via nvm (to be installed beforehand)
echo -e "${YELLOW}Updating Node.js...${NC}"
if nvm install node --reinstall-packages-from=node; then
    echo -e "${GREEN}Node.js update completed successfully! ✔${NC}"
else
    echo -e "${RED}Node.js update failed! ✖${NC}"
fi

# Installing http-server to test projects
echo -e "${YELLOW}Installing http-server...${NC}"
if pnpm add -g http-server; then
    echo -e "${GREEN}http-server installation completed successfully! ✔${NC}"
else
    echo -e "${RED}http-server installation failed! ✖${NC}"
fi

echo -e "${GREEN}Update and installation processes are complete! ✔${NC}"
