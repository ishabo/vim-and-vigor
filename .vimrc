" ============================================================================
" Joshua's Neovim/Vim Configuration
" ============================================================================
" Modular configuration split into multiple files for easier maintenance
"
" Structure:
"   ~/.vim/plugins.vim    - Plugin definitions (vim-plug)
"   ~/.vim/settings.vim   - Core Vim settings and options
"   ~/.vim/themes.vim     - Color schemes and visual settings
"   ~/.vim/keymaps.vim    - Key mappings and commands
"   ~/.vim/languages.vim  - Language-specific configurations
"   ~/.cocrc              - CoC-specific keybindings (sourced separately)

" -----------------------------------------------------------------------------
" Load CoC Configuration First (contains critical keybindings)
" -----------------------------------------------------------------------------
source ~/.cocrc

" -----------------------------------------------------------------------------
" Load Modular Configuration Files
" -----------------------------------------------------------------------------
source ~/.vim/plugins.vim
source ~/.vim/settings.vim
source ~/.vim/themes.vim
source ~/.vim/keymaps.vim
source ~/.vim/languages.vim

" -----------------------------------------------------------------------------
" Local/Custom Overrides (optional)
" -----------------------------------------------------------------------------
" Create ~/.vimrc.local for machine-specific settings that won't be in version control
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
