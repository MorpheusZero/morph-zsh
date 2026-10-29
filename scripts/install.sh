#!/bin/bash
set -euo pipefail

MORPH_ZSH_HOME="${HOME}/.morph-zsh"
ZSHRC="${HOME}/.zshrc"

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

echo "Done! Installed at ${MORPH_ZSH_HOME}. Please restart your terminal to start using MorphZSH."
