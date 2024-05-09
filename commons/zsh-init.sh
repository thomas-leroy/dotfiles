#!/bin/sh

# Path to the user's .zshrc file
ZSHRC="${HOME}/.zshrc"
ALIASES="${PWD}"

# Text to add to .zshrc to load .zsh files
ALIAS_LOADER="
# Load all alias files from the \"zsh\" directory
for file in \"$ALIASES/zsh/*.zsh\"; do
    if [ -f \"\$file\" ]; then
        source \"\$file\"
    fi
done
"

# Check if the text is already present to avoid duplicates
if grep -q 'Load all alias files from the "zsh" directory' "$ZSHRC"; then
    echo "Aliases are already configured in .zshrc."
else
    # Add the text to .zshrc
    echo "$ALIAS_LOADER" >> "$ZSHRC"
    echo "Aliases have been added to .zshrc."
fi
