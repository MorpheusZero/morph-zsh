# name: MorphZSH Theme Loader Plugin
# version: 1.0.0
# description: Loads the Agnoster theme and configures it for use with MorphZSH.

# Enable native Zsh color formatting and version control integration
autoload -Uz colors vcs_info && colors

# Configure the Zsh version control system hook (required by Agnoster for Git)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b'

# Define defaults expected by the Agnoster theme
export DEFAULT_USER=$(whoami)

# Source the theme script
if [[ -f $MORPH_ZSH_HOME/themes/agnoster.zsh-theme ]]; then
    source $MORPH_ZSH_HOME/themes/agnoster.zsh-theme
    # Force the prompt to draw itself on initialization
    precmd() {
        vcs_info
        print -rn -- "$($prompt_agnoster_main)"
    }
fi