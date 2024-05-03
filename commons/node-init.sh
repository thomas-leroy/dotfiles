#!/bin/bash

# Configuration of the directory for global npm packages
echo -e "\e[34mConfiguring directory for global npm packages...\e[0m"
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
echo -e "\e[32mDirectory configuration completed! ✔\e[0m"

# Updating Node.js and npm via nvm (to be installed beforehand)
echo -e "\e[33mUpdating Node.js...\e[0m"
if nvm install node --reinstall-packages-from=node; then
    echo -e "\e[32mNode.js update completed successfully! ✔\e[0m"
else
    echo -e "\e[31mNode.js update failed! ✖\e[0m"
fi

# Installing http-server to test projects
echo -e "\e[33mInstalling http-server...\e[0m"
if npm install -g http-server; then
    echo -e "\e[32mhttp-server installation completed successfully! ✔\e[0m"
else
    echo -e "\e[31mhttp-server installation failed! ✖\e[0m"
fi

echo -e "\e[32mUpdate and installation processes are complete! ✔\e[0m"
