#!/bin/bash

# Colors for display
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Initializing git environment
echo -e "${BLUE}INIT: Initializing git environment...${NC}"

# Prompting the user for information
echo -e "${YELLOW}Please enter the following information:${NC}"
read -p "Email address: " email
read -p "Full name: " fullname
read -p "GPG key ID (if available, otherwise a new one will be created): " gpgkeyid

# Configuring Git with the provided information
git config --global user.email "${email}"
git config --global user.name "${fullname}"

if [[ -z "$gpgkeyid" ]]; then
    echo -e "${YELLOW}No GPG key provided. Generating a new GPG key...${NC}"
    gpg --quick-gen-key "${fullname} <${email}>" rsa4096 sign,auth,encr 0 --no-protection
    gpgkeyid=$(gpg --list-secret-keys --keyid-format LONG "${email}" | grep sec | awk '{print $2}' | cut -d'/' -f2)
    echo -e "${GREEN}New GPG key created with ID: $gpgkeyid ✔${NC}"
fi

git config --global user.signingkey "${gpgkeyid}"
git config --global commit.gpgsign true

git config --global core.pager "less"
git config --global core.excludesfile ~/.gitignore

# Creating a new SSH key, with the email as a label
echo -e "${YELLOW}Generating an SSH key for ${email}...${NC}"
ssh-keygen -t rsa -b 4096 -C "${email}" -f ~/.ssh/id_rsa -N ""

# Starting ssh-agent and adding the key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Displaying the SSH public key, ready to be copied to GitHub
echo -e "${YELLOW}Copy the SSH public key below to add it to your GitHub account:${NC}"
cat ~/.ssh/id_rsa.pub

# Displaying the GPG public key, ready to be copied to GitHub
echo -e "${YELLOW}Copy the GPG public key below to add it to your GitHub account:${NC}"
gpg --armor --export "${gpgkeyid}"

# Configuring terminal to set GPG_TTY automatically
echo -e "${YELLOW}Configuring terminal to set GPG_TTY automatically...${NC}"
echo "export GPG_TTY=$(tty)" >> ~/.zshrc
echo -e "${GREEN}Terminal configured to set GPG_TTY automatically! ✔${NC}"

echo -e "${GREEN}Git configuration completed! ✔${NC}"
