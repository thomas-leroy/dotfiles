#!/bin/bash

# Inspired by holman dotfile 
# https://github.com/holman/dotfiles

# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
