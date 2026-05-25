# Aliases
alias l="eza --icons --git"
alias ll="eza -alh --icons --git"
alias la="eza -la --git"
alias tree="eza --tree --icons --git"
alias c="clear"

# Zoxide (Better cd)
if command -v zoxide >/dev/null; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi
