#!/bin/bash
set -euo pipefail

# Prereqs
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew (brew) is not installed. Please install it to continue." >&2
    exit 1
fi

MORPH_ZSH_HOME="${HOME}/.morph-zsh"
ZSHRC="${HOME}/.zshrc"

# Install Herdr
curl -fsSL https://herdr.dev/install.sh | sh

# Install Autosuggestions
brew install zsh-autosuggestions

# Install MorphZSH
if [[ -d "${MORPH_ZSH_HOME}/.git" ]]; then
    echo "MorphZSH already present at ${MORPH_ZSH_HOME}; skipping clone."
elif [[ -e "${MORPH_ZSH_HOME}" ]]; then
    echo "Error: ${MORPH_ZSH_HOME} exists and is not a MorphZSH checkout." >&2
    exit 1
else
    git clone https://github.com/MorpheusZero/morph-zsh.git "${MORPH_ZSH_HOME}"
fi

append_once() {
    local file="$1"
    local line="$2"
    touch "${file}"
    grep -qxF "${line}" "${file}" || printf '%s\n' "${line}" >> "${file}"
}

append_once "${ZSHRC}" "MORPH_ZSH_HOME=${MORPH_ZSH_HOME}"
append_once "${ZSHRC}" "source ${MORPH_ZSH_HOME}/morph.zshrc"

# Load Autosuggestions
AUTOSUGGESTIONS="$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
append_once "${MORPH_ZSH_HOME}/morph.zshrc" "source ${AUTOSUGGESTIONS}"

# Setup Herdr to load first
# Add Herdr to path
append_once "${MORPH_ZSH_HOME}/morph.zshrc" 'export PATH="$HOME/.local/bin:$PATH"'
if ! grep -q 'HERDR_PANE_ID' "${MORPH_ZSH_HOME}/morph.zshrc"; then
    cat >> "${MORPH_ZSH_HOME}/morph.zshrc" <<'EOF'

if [[ -z "$HERDR_PANE_ID" ]]; then
  herdr 2> /dev/null
fi
EOF
fi

echo "Done! Installed at ${MORPH_ZSH_HOME}. Please restart your terminal to start using MorphZSH."
