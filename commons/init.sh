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

# PNPM installation
echo -e "${YELLOW}Starting PNPM setup...${NC}"
if ./commons/node-init.sh; then
    echo -e "${GREEN}PNPM setup completed successfully! ✔${NC}"
else
    echo -e "${RED}PNPM setup failed! ✖${NC}"
fi

# Z installation
echo -e "${YELLOW}Starting Z setup...${NC}"
if ./commons/z-init.sh; then
    echo -e "${GREEN}Z setup completed successfully! ✔${NC}"
else
    echo -e "${RED}Z setup failed! ✖${NC}"
fi

# ZSH aliases installation
echo -e "${YELLOW}Adding aliases to .zshrc...${NC}"
if ./commons/zsh-init.sh; then
    echo -e "${GREEN}Aliases successfully added! ✔${NC}"
else
    echo -e "${RED}Failed to add aliases to .zshrc! ✖${NC}"
fi