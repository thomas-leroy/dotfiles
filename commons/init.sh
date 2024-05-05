#!/bin/bash

# Colors for display
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# Initialization: Setting up tools
echo -e "${BLUE}INITIALIZATION: Setting up tools...${NC}"

# Git installation
echo -e "${YELLOW}Starting Git setup...${NC}"
if ./commons/git-init.sh; then
    echo -e "${GREEN}Git setup completed successfully! ✔${NC}"
else
    echo -e "${RED}Git setup failed! ✖${NC}"
fi

# NPM installation
echo -e "${YELLOW}Starting NPM setup...${NC}"
if ./commons/node-init.sh; then
    echo -e "${GREEN}NPM setup completed successfully! ✔${NC}"
else
    echo -e "${RED}NPM setup failed! ✖${NC}"
fi

# Z installation
echo -e "${YELLOW}Starting Z setup...${NC}"
if ./commons/Z-init.sh; then
    echo -e "${GREEN}NPM setup completed successfully! ✔${NC}"
else
    echo -e "${RED}NPM setup failed! ✖${NC}"
fi