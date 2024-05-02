#!/bin/bash

# Vérifie si Homebrew est installé, sinon l'installe
if ! command -v brew &>/dev/null; then
    echo "Homebrew n'est pas installé. Installation de Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Mettre à jour Homebrew
echo "Mise à jour de Homebrew..."
brew update

# Installation du terminal Warp
echo "Installation du terminal Warp..."
brew install --cask warp

# Installation de Zsh
echo "Installation de Zsh et Oh My Zsh..."
brew install zsh

# Configuration du shell par défaut
if [ ! "$SHELL" = "/bin/zsh" ]; then
    echo "Configuration de Zsh comme shell par défaut..."
    chsh -s /bin/zsh
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configuration d'un thème visuel sombre pour le terminal (Powerlevel10k)
echo "Installation du thème Powerlevel10k pour un visuel sombre..."
brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

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
brew install --cask docker
brew install docker-compose

# Installer Visual Studio Code
echo "Installation de Visual Studio Code..."
brew install --cask visual-studio-code

echo "Installation terminée. Veuillez ouvrir un nouveau terminal pour que les changements prennent effet."
