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

# If MORPH_ZSH_THEME is set, use it instead of the default theme
if [ -n "$MORPH_ZSH_THEME" ]; then
    THEME_FILE="$MORPH_ZSH_HOME/themes/$MORPH_ZSH_THEME.zsh-theme"
else
    THEME_FILE="$MORPH_ZSH_HOME/themes/agnoster.zsh-theme"
fi

# Source the theme script
if [[ -f $THEME_FILE ]]; then
    source $THEME_FILE
    # Force the prompt to draw itself on initialization
    precmd() {
        vcs_info
        print -rn -- "$($prompt_theme_main)"
    }
fi