# MorphZSH Configuration

if [ -z "$MORPH_ZSH_HOME" ]; then
    echo "MORPH_ZSH_HOME is not set"
    echo "Please set the MORPH_ZSH_HOME environment variable"
    echo "For example: export MORPH_ZSH_HOME=/path/to/morph-zsh"
    return 1
fi

# Set required opts
setopt prompt_subst

# Load plugins (comment out plugins that you don't want to use)
source $MORPH_ZSH_HOME/plugins/theme-loader.zshrc
source $MORPH_ZSH_HOME/plugins/fs.zshrc
source $MORPH_ZSH_HOME/plugins/git.zshrc