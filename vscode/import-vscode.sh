#!/bin/bash

# Définition du répertoire utilisateur de VS Code en fonction du système d'exploitation
if [ "$(uname -s)" = "Darwin" ]; then
    VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
else
    VSCODE_USER_DIR="$HOME/.config/Code/User"
fi

echo "Importing VSCode configuration from repository..."

# Importation des paramètres
if [ -f "./vscode/ressources/settings.json" ]; then
    cp "./vscode/ressources/settings.json" "$VSCODE_USER_DIR/settings.json"
    echo "Settings imported successfully."
else
    echo "No settings.json in repository, skipping."
fi

# Importation des raccourcis clavier
if [ -f "./vscode/ressources/keybindings.json" ]; then
    cp "./vscode/ressources/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"
    echo "Keybindings imported successfully."
else
    echo "No keybindings.json in repository, skipping."
fi

# Installation des extensions
if [ -f "./vscode/ressources/extensions.list" ]; then
    cat "./vscode/ressources/extensions.list" | xargs -L 1 code --install-extension
    echo "Extensions imported successfully."
else
    echo "No extensions.list found, skipping."
fi
