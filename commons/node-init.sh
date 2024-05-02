#!/bin/bash

# Configuration du répertoire pour les paquets globaux npm
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH

# Mise à jour de Node.js et npm via nvm (à installer au préalable)
echo "Mise à jour de Node.js..."
nvm install node --reinstall-packages-from=node

# Installer http-server pour tester les projets
echo "Installation de http-server..."
npm install -g http-server

echo "Mise à jour et installation terminées."
