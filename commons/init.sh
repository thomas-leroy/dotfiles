#!/bin/bash

# Initialization: Setting up tools
echo -e "\e[34mINITIALIZATION: Setting up tools...\e[0m"

# Github installation
echo -e "\e[33mStarting GitHub setup...\e[0m"
if ./commons/git-init.sh; then
    echo -e "\e[32mGitHub setup completed successfully! ✔\e[0m"
else
    echo -e "\e[31mGitHub setup failed! ✖\e[0m"
fi

# NPM installation
echo -e "\e[33mStarting NPM setup...\e[0m"
if ./commons/node-init.sh; then
    echo -e "\e[32mNPM setup completed successfully! ✔\e[0m"
else
    echo -e "\e[31mNPM setup failed! ✖\e[0m"
fi
