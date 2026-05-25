#!/bin/bash

# Get the directory of the script
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo "Starting dotfiles installation..."
mkdir -p "$BACKUP_DIR"

link_file() {
    local src=$1
    local dest=$2
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up existing $dest to $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi
    echo "Linking $dest -> $src"
    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
}

link_file "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

if [ -f "$DOTFILES_DIR/zsh/zshrc" ]; then
    link_file "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
fi

echo "Installation complete!"
