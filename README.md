# 🛠️ Dotfiles

My personal configuration files for a productive development environment.

## 📦 Included Configurations

- **Zsh**: Custom aliases, environment variables, and plugin management.
- **Neovim**: A Lua-based configuration (LazyVim inspired) focused on Go and web development.
- **Tmux**: Enhanced multiplexer setup with intuitive keybindings and popup support.
- **Git**: Global settings with a secure separation of personal information.

## 🚀 Installation & Bootstrapping

This project includes a bootstrap script that installs Homebrew (if missing), all necessary CLI tools via a `Brewfile`, and sets up your symlinks.

> [!WARNING]
> The script will back up your existing configuration files to `~/.dotfiles_backup/` before creating symbolic links.

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/dotfiles.git ~/dev/dotfiles
   ```

2. Navigate to the directory:
   ```bash
   cd ~/dev/dotfiles
   ```

3. Run the bootstrap script:
   ```bash
   ./install.sh
   ```

## 🛠️ Dependencies

The `install.sh` script automatically installs the following via Homebrew:
- `neovim`, `tmux`, `zoxide`, `fzf`, `ripgrep`, `eza`, `bat`, `fd`

## 🔒 Privacy & Local Configuration

To keep this repository public-safe, personally identifiable information (PII) is kept in local files that are ignored by Git.

### Git
The main `git/gitconfig` includes a local file. Create `git/gitconfig.local` for your personal details:

```ini
[user]
    name = Your Name
    email = your.email@example.com
```

## ⌨️ Key Features

### Tmux
- **Prefix**: `Ctrl+A` (remapped from `Ctrl+B`)
- **Split Panes**: `|` for vertical, `-` for horizontal.
- **FZF Popup**: `Ctrl+A` -> `Ctrl+F` to search files in a popup.

### Neovim
- **Plugin Manager**: Lazy.nvim
- **Structure**: Modular Lua config in `lua/config/` and `lua/plugins/`.

---
*Maintained by codewitheragon*
