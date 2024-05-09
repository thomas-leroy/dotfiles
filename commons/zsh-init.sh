#!/bin/sh

# Define the path to the .zshrc file
ZSHRC="${HOME}/.zshrc"

# Define the directory containing the alias files
ALIAS_DIR="${PWD}/zsh"

# Check if the alias directory exists
if [ ! -d "$ALIAS_DIR" ]; then
    echo "The directory $ALIAS_DIR does not exist. Exiting."
    exit 1
fi

# Backup the existing .zshrc file
cp "$ZSHRC" "$ZSHRC.bak"

# Add a comment to .zshrc indicating the start of auto-imported aliases
echo "# Auto-imported aliases from $ALIAS_DIR" >> "$ZSHRC"

# Loop over each .sh and .zsh file in the directory and add a source command to .zshrc
for file in "$ALIAS_DIR"/*.sh "$ALIAS_DIR"/*.zsh; do
    if [ -f "$file" ]; then
        echo "source $file" >> "$ZSHRC"
    fi
done

echo "Aliases have been added to your .zshrc file."
