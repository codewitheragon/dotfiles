#!/bin/bash

# Get the directory of the script
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

echo "🚀 Starting dotfiles bootstrap..."

# 1. Install Homebrew if missing
if ! command -v brew >/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to path for the current session
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "✅ Homebrew already installed."
fi

# 2. Install dependencies from Brewfile
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "📦 Installing dependencies from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
fi

# 3. Create backup directory
mkdir -p "$BACKUP_DIR"

link_file() {
    local src=$1
    local dest=$2
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "📦 Backing up existing $dest to $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi
    echo "🔗 Linking $dest -> $src"
    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
}

# 4. Link configurations
echo "🔗 Creating symlinks..."
link_file "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/yazi" "$HOME/.config/yazi"
link_file "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

if [ -f "$DOTFILES_DIR/zsh/zshrc" ]; then
    link_file "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
fi

echo "✅ Bootstrap complete! Please restart your terminal."
