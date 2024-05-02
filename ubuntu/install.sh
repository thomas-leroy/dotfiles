#!/bin/bash

# Mise à jour des paquets et installation des outils nécessaires
echo "Mise à jour des paquets..."
sudo apt update && sudo apt upgrade -y

# Installation de Zsh et Oh My Zsh
echo "Installation de Zsh et configuration de Oh My Zsh..."
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configuration d'un thème visuel sombre pour le terminal (Powerlevel10k)
echo "Installation du thème Powerlevel10k..."
sudo apt install -y git fonts-powerline
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Installation de nvm pour gérer les versions de Node.js
echo "Installation de nvm (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Installation de la dernière version stable de Node.js via nvm
echo "Installation de Node.js via nvm..."
nvm install node  # Installe la dernière version disponible de Node.js
nvm use node      # Utilise la version de Node.js installée

# Installation de Docker & Docker Compose
echo "Installation de Docker et Docker Compose..."
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Installer Visual Studio Code
echo "Installation de Visual Studio Code..."
sudo snap install --classic code

echo "Installation terminée. Veuillez ouvrir un nouveau terminal ou redémarrer votre session pour que les changements prennent effet."
