# name: MorphZSH Filesystem  Plugin
# version: 1.0.0
# description: Handles common filesystem interactions and aliases that we need.

# aliases
alias ll='ls -lah'
alias mkdir='mkdir -p'
alias rm='rm -rf'
alias cp='cp -r'
alias mv='mv -r'

# Setup Autoccomplete
# Initialize the Zsh completion system
autoload -Uz compinit
compinit

# Enable the visual menu selection
zstyle ':completion:*' menu select

# Force TAB to cycle forward through the menu options
bindkey '^I' menu-complete

# Optional: Press Shift+TAB to cycle backward through options
bindkey '^[[Z' reverse-menu-complete

# Optional: Make the menu pretty and group options by type
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" 
