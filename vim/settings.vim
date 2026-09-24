" ============================================================================
" Core Vim Settings
" ============================================================================

" -----------------------------------------------------------------------------
" Basic Settings
" -----------------------------------------------------------------------------
syntax on
filetype plugin indent on
set encoding=UTF-8
set hidden                      " Allow hidden buffers with unsaved changes
set noswapfile                  " Disable swap files
set nobackup                    " Disable backup files
set nowritebackup              " Disable backup before overwriting
set mouse=a                     " Enable mouse support
set clipboard=unnamed           " Use system clipboard
set number                      " Show line numbers
set modifiable                  " Allow buffer modification

" -----------------------------------------------------------------------------
" Auto-Save
" -----------------------------------------------------------------------------
set autowrite                   " Auto-save on buffer switch, :make, etc.
set autowriteall                " Auto-save on all buffer-leaving events
autocmd FocusLost * silent! wa  " Auto-save all buffers when Vim loses focus

" -----------------------------------------------------------------------------
" Indentation
" -----------------------------------------------------------------------------
set smarttab
set cindent
set smartindent
set expandtab                   " Use spaces instead of tabs
set shiftwidth=2               " Indent by 2 spaces
set softtabstop=2              " Tab key inserts 2 spaces

" -----------------------------------------------------------------------------
" Folding
" -----------------------------------------------------------------------------
set foldmethod=manual          " Manual folding (fast, use zf to create folds)
set foldlevel=99               " Open all folds by default
" Note: Change to 'expr' with Treesitter after plugins load for smart folding
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" -----------------------------------------------------------------------------
" Display & UI
" -----------------------------------------------------------------------------
set cmdheight=2                " Height of command line
set laststatus=2               " Always show status line
set showcmd                    " Show partial commands
set wildmenu                   " Enhanced command line completion
set listchars=eol:¬,tab:>•,trail:~,extends:>,precedes:<,space:␣
set nolist                     " Don't show invisible characters by default
set cursorline                 " Highlight current line
set nocursorcolumn             " Don't highlight current column

" -----------------------------------------------------------------------------
" Status Line
" -----------------------------------------------------------------------------
" Format: filepath [modified][readonly][help][preview] [lines|line/col|percentage]
set statusline=%F%m%r%h%w\ [%L\\|%l/%c%V]

" -----------------------------------------------------------------------------
" Split Behavior
" -----------------------------------------------------------------------------
set splitbelow                 " New horizontal splits open below
set splitright                 " New vertical splits open to the right

" -----------------------------------------------------------------------------
" Performance
" -----------------------------------------------------------------------------
set updatetime=800             " CursorHold / diagnostics (was 300; lower = more CPU)
set lazyredraw                 " Don't redraw during macros
set ttyfast                    " Faster terminal connection
set timeoutlen=1000            " Wait 1s for key sequence completion
set ttimeoutlen=0              " No delay for key codes

" -----------------------------------------------------------------------------
" Completion Menu
" -----------------------------------------------------------------------------
set completeopt=menu,menuone,preview,noselect,noinsert
set shortmess+=c               " Don't pass messages to completion menu

" -----------------------------------------------------------------------------
" GUI Settings (if running gVim/MacVim)
" -----------------------------------------------------------------------------
if has('gui_running')
    set transparency=80
    set background=light
    set guifont=Terminess\ Powerline\ 12
else
    set background=light
endif

" -----------------------------------------------------------------------------
" Terminal Colors
" -----------------------------------------------------------------------------
set t_Co=256                   " Enable 256 colors
set t_ut=                      " Disable background color erase

" -----------------------------------------------------------------------------
" Temp Files Location
" -----------------------------------------------------------------------------
set directory^=$HOME/.vim/tmp//

" -----------------------------------------------------------------------------
" CoC-specific Settings
" -----------------------------------------------------------------------------
" Pin Node so nvm shell switches don't break CoC mid-session
let g:coc_node_path = expand('~/.nvm/versions/node/v20.19.6/bin/node')
set runtimepath^=~/.coc-extensions/coc-solidity/packages/coc-solidity
