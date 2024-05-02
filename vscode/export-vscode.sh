#!/bin/bash

# Définition du répertoire utilisateur de VS Code en fonction du système d'exploitation
if [ "$(uname -s)" = "Darwin" ]; then
    VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
else
    VSCODE_USER_DIR="$HOME/.config/Code/User"
fi

echo "Exporting VSCode configuration to repository..."

# Exportation des paramètres
if [ -f "$VSCODE_USER_DIR/settings.json" ]; then
    cp "$VSCODE_USER_DIR/settings.json" "./vscode/ressources/settings.json"
    echo "Settings exported successfully."
else
    echo "No settings.json found, skipping."
fi

# Exportation des raccourcis clavier
if [ -f "$VSCODE_USER_DIR/keybindings.json" ]; then
    cp "$VSCODE_USER_DIR/keybindings.json" "./vscode/ressources/keybindings.json"
    echo "Keybindings exported successfully."
else
    echo "No keybindings.json found, skipping."
fi

# Liste des extensions
code --list-extensions > "./vscode/ressources/extensions.list"
echo "Extensions list exported successfully."
