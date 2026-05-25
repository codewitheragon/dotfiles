# Define dotfiles directory
export DOTFILES=$HOME/dev/dotfiles

# Load modular configs
source $DOTFILES/zsh/env.zsh
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/plugins.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Initialize Starship Prompt
eval "$(starship init zsh)"

# zoxide setup
eval "$(zoxide init zsh)"
