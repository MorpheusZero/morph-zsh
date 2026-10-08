#!/bin/bash

cd ~

git clone https://github.com/morph-zsh/morph-zsh.git .morph-zsh

echo "MORPH_ZSH_HOME=~/.morph-zsh" >> ~/.zshrc

echo "source ~/.morph-zsh/morph.zshrc" >> ~/.zshrc

echo "Done! Installed at $MORPH_ZSH_HOME. Please restart your terminal to start using MorphZSH."