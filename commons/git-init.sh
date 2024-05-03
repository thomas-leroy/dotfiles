#!/bin/bash

# Initializing git environment
echo -e "\e[34mINIT: Initializing git environment...\e[0m"

# Prompting the user for information
echo -e "\e[33mPlease enter the following information:\e[0m"
read -p "Email address: " email
read -p "Full name: " fullname
read -p "GPG key ID (if available, otherwise a new one will be created): " gpgkeyid

# Configuring Git with the provided information
git config --global user.email "${email}"
git config --global user.name "${fullname}"

if [[ -z "$gpgkeyid" ]]; then
    # Creating a new GPG key if none is provided
    echo -e "\e[33mNo GPG key provided. Generating a new GPG key...\e[0m"
    gpg --batch --full-generate-key <<EOF
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: ${fullname}
Name-Email: ${email}
Expire-Date: 0
EOF

    # Retrieving the ID of the newly created GPG key
    gpgkeyid=$(gpg --list-secret-keys --keyid-format LONG | grep sec | awk '{print $2}' | cut -d'/' -f2)
    echo -e "New GPG key created with ID: $gpgkeyid \e[32m✔\e[0m"
fi

# Configuring the GPG key in Git
git config --global user.signingkey "${gpgkeyid}"
git config --global commit.gpgsign true

git config --global core.pager "less"
git config --global core.excludesfile ~/.gitignore

# Creating a new SSH key, with the email as a label
echo -e "\e[33mGenerating an SSH key for ${email}...\e[0m"
ssh-keygen -t rsa -b 4096 -C "${email}" -f ~/.ssh/id_rsa -N ""

# Starting ssh-agent and adding the key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Displaying the SSH public key, ready to be copied to GitHub
echo -e "\e[33mCopy the SSH public key below to add it to your GitHub account:\e[0m"
cat ~/.ssh/id_rsa.pub

# Displaying the GPG public key, ready to be copied to GitHub
echo -e "\e[33mCopy the GPG public key below to add it to your GitHub account:\e[0m"
gpg --armor --export "${gpgkeyid}"

echo -e "\e[32mGit configuration completed! ✔\e[0m"
