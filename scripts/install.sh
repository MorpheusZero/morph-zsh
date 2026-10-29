#!/bin/bash

# Prereqs
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew (brew) is not installed. Please install it to continue." >&2
    exit 1
fi

cd ~

# Install Herdr
curl -fsSL https://herdr.dev/install.sh | sh

# Install Autosuggestions
brew install zsh-autosuggestions

# Install MorphZSH
git clone https://github.com/MorpheusZero/morph-zsh.git .morph-zsh

echo "MORPH_ZSH_HOME=~/.morph-zsh" >> ~/.zshrc

echo "source ~/.morph-zsh/morph.zshrc" >> ~/.zshrc

# Load Autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $MORPH_ZSH_HOME/morph.zshrc

# Setup Herder to load first
echo '
if [[ -z "$HERDR_PANE_ID" ]]; then
  herdr 2> /dev/null
fi' >> $MORPH_ZSH_HOME/morph.zshrc

echo "Done! Installed at $MORPH_ZSH_HOME. Please restart your terminal to start using MorphZSH."