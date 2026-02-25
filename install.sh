#!/bin/bash

set -e

echo "Installing vim/nvim configuration..."

# Backup existing configs
backup_dir="$HOME/.vim-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"

if [ -f "$HOME/.vimrc" ]; then
    echo "Backing up existing .vimrc to $backup_dir"
    mv "$HOME/.vimrc" "$backup_dir/"
fi

if [ -d "$HOME/.vim" ]; then
    echo "Backing up existing .vim directory to $backup_dir"
    mv "$HOME/.vim" "$backup_dir/"
fi

if [ -d "$HOME/.config/nvim" ]; then
    echo "Backing up existing .config/nvim to $backup_dir"
    mv "$HOME/.config/nvim" "$backup_dir/"
fi

# Create symlinks
echo "Creating symlinks..."
ln -sf "$(pwd)/.vimrc" "$HOME/.vimrc"
ln -sf "$(pwd)/vim" "$HOME/.vim"
mkdir -p "$HOME/.config"
ln -sf "$(pwd)/nvim" "$HOME/.config/nvim"

echo ""
echo "✓ Installation complete!"
echo ""
echo "Symlinks created:"
echo "  ~/.vimrc -> $(pwd)/.vimrc"
echo "  ~/.vim -> $(pwd)/vim"
echo "  ~/.config/nvim -> $(pwd)/nvim"
echo ""
echo "Backups saved to: $backup_dir"
