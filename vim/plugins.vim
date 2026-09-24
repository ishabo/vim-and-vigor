" ============================================================================
" Plugin Management
" ============================================================================
" All plugins managed via vim-plug

call plug#begin()

" -----------------------------------------------------------------------------
" Core IDE Features
" -----------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', { 'branch': 'release' }  " LSP, autocompletion, linting
Plug 'github/copilot.vim'                           " GitHub Copilot

" -----------------------------------------------------------------------------
" Source Control
" -----------------------------------------------------------------------------
Plug 'airblade/vim-gitgutter'                       " Git diff in gutter
Plug 'oguzbilgic/vim-gdiff'                         " Git diff viewer
Plug 'tpope/vim-fugitive'                           " Git commands (:Git blame, :Git)

" -----------------------------------------------------------------------------
" File Navigation & Search
" -----------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                             " Fuzzy finder

" -----------------------------------------------------------------------------
" General Editing
" -----------------------------------------------------------------------------
Plug 'tpope/vim-commentary'                         " Comment/uncomment with gc
Plug 'anyakichi/vim-surround'                       " Surround text objects
Plug 'pseewald/anyfold'                             " Smart code folding

" -----------------------------------------------------------------------------
" Terminal & Tmux Integration
" -----------------------------------------------------------------------------
Plug 'tmux-plugins/vim-tmux-focus-events'           " Focus events for tmux
Plug 'christoomey/vim-tmux-navigator'               " Navigate between Vim and tmux panes

" -----------------------------------------------------------------------------
" Language Support - Build Tools
" -----------------------------------------------------------------------------
Plug 'c9s/vim-makefile'                             " Makefile syntax
" LSP is owned by CoC only (no nvim-lspconfig — avoids duplicate language servers)

" -----------------------------------------------------------------------------
" Language Support - JavaScript/TypeScript
" -----------------------------------------------------------------------------
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm i'}  " Import JS/TS files
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Robust syntax highlighting (handles TS decorators)

" -----------------------------------------------------------------------------
" Language Support - Python
" -----------------------------------------------------------------------------
Plug 'vim-python/python-syntax'                     " Enhanced Python syntax

" -----------------------------------------------------------------------------
" Language Support - Golang
" -----------------------------------------------------------------------------
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}   " Go development
Plug 'vim-scripts/cue.vim'                          " Cue syntax

" -----------------------------------------------------------------------------
" Language Support - Rust
" -----------------------------------------------------------------------------
Plug 'timonv/vim-cargo'                             " Rust Cargo integration
Plug 'rust-lang/rust.vim'                           " Rust syntax and tools
Plug 'vim-test/vim-test'                            " Test runner

" -----------------------------------------------------------------------------
" Language Support - Other
" -----------------------------------------------------------------------------
Plug 'tomlion/vim-solidity'                         " Solidity syntax
Plug 'jparise/vim-graphql'                          " GraphQL syntax
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" -----------------------------------------------------------------------------
" Visual & UI
" -----------------------------------------------------------------------------
Plug 'blueyed/vim-diminactive'                      " Dim inactive windows
Plug 'gorodinskiy/vim-coloresque'                   " Color preview for hex codes
Plug 'morhetz/gruvbox'                              " Gruvbox theme
Plug 'ryanoasis/vim-devicons'                       " File type icons

call plug#end()
