# Vim/Neovim Configuration

Personal vim and neovim configuration files.

## Structure

```
.
├── .vimrc              # Main vim configuration
├── vim/                # Vim-specific files
│   ├── keymaps.vim     # Key mappings
│   ├── languages.vim   # Language-specific settings
│   ├── plugins.vim     # Plugin configurations
│   ├── settings.vim    # General settings
│   └── themes.vim      # Theme/color configurations
└── nvim/               # Neovim-specific files
    ├── init.vim        # Neovim initialization
    └── coc-settings.json  # CoC (Conquer of Completion) settings
```

## Installation

1. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/vim-config
   cd ~/vim-config
   ```

2. Run the install script:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

   This will:
   - Back up any existing vim/nvim configurations
   - Create symlinks from your home directory to this repository

## Manual Installation

If you prefer to set up symlinks manually:

```bash
ln -sf ~/vim-config/.vimrc ~/.vimrc
ln -sf ~/vim-config/vim ~/.vim
mkdir -p ~/.config
ln -sf ~/vim-config/nvim ~/.config/nvim
```

## Dependencies

- Vim 8.0+ or Neovim 0.5+
- [CoC (Conquer of Completion)](https://github.com/neoclide/coc.nvim)
- Node.js (for CoC)

You may need to install plugins after setup. Check the `vim/plugins.vim` file for the plugin manager and plugin list.

## Syncing Changes

Since the configs are symlinked to this repository, any changes you make to your vim/nvim configuration will be reflected here. Simply commit and push:

```bash
cd ~/vim-config
git add .
git commit -m "Update configuration"
git push
```
