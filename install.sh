#!/bin/bash

set -e
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing vim/nvim configuration..."
ensure_homebrew_package() {
    local bin_name="$1"
    local package_name="$2"

    if command -v "$bin_name" >/dev/null 2>&1; then
        return
    fi

    if command -v brew >/dev/null 2>&1; then
        echo "Installing $package_name..."
        brew install "$package_name"
        return
    fi

    echo "Missing required dependency: $bin_name"
    echo "Install Homebrew or install $package_name manually, then rerun this script."
    exit 1
}

backup_path() {
    local target_path="$1"
    local label="$2"

    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
        echo "Backing up existing $label to $backup_dir"
        mv "$target_path" "$backup_dir/"
    fi
}

ensure_homebrew_package nvim neovim
ensure_homebrew_package node node
ensure_homebrew_package rg ripgrep
ensure_homebrew_package fzf fzf

if command -v brew >/dev/null 2>&1; then
    "$(brew --prefix)/opt/fzf/install" --all --no-bash --no-zsh --no-fish >/dev/null 2>&1 || true
fi

# Backup existing configs
backup_dir="$HOME/.vim-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"
backup_path "$HOME/.vimrc" ".vimrc"
backup_path "$HOME/.cocrc" ".cocrc"
backup_path "$HOME/.vim" ".vim directory"
backup_path "$HOME/.config/nvim" ".config/nvim"

# Create symlinks
echo "Creating symlinks..."
ln -sfn "$repo_dir/.vimrc" "$HOME/.vimrc"
ln -sfn "$repo_dir/.cocrc" "$HOME/.cocrc"
ln -sfn "$repo_dir/vim" "$HOME/.vim"
mkdir -p "$HOME/.config"
ln -sfn "$repo_dir/nvim" "$HOME/.config/nvim"

vim_plug_path="$HOME/.local/share/nvim/site/autoload/plug.vim"
if [ ! -f "$vim_plug_path" ]; then
    echo "Installing vim-plug..."
    curl -fLo "$vim_plug_path" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Running Neovim plugin install/update..."
nvim --headless "+PlugInstall --sync" +qa
nvim --headless "+PlugUpdate --sync" +qa
nvim --headless "+TSUpdateSync" +qa || true
nvim --headless "+CocUpdateSync" +qa || true

echo ""
echo "✓ Installation complete!"
echo ""
echo "Symlinks created:"
echo "  ~/.vimrc -> $repo_dir/.vimrc"
echo "  ~/.cocrc -> $repo_dir/.cocrc"
echo "  ~/.vim -> $repo_dir/vim"
echo "  ~/.config/nvim -> $repo_dir/nvim"
echo ""
echo "Backups saved to: $backup_dir"
