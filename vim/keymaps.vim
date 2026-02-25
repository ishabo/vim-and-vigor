" ============================================================================
" Key Mappings & Commands
" ============================================================================

" -----------------------------------------------------------------------------
" Leader Key
" -----------------------------------------------------------------------------
let mapleader=","

" -----------------------------------------------------------------------------
" File Navigation
" -----------------------------------------------------------------------------
" Fuzzy file finder
nmap <C-p> :FZF<CR>
" Buffer list (FZF)
nmap <C-b> :Buffers<CR>

" -----------------------------------------------------------------------------
" Buffer Navigation
" -----------------------------------------------------------------------------
" Next buffer
map gn :bn<cr>
" Previous buffer
map gp :bp<cr>

" -----------------------------------------------------------------------------
" Git Hunks Navigation
" -----------------------------------------------------------------------------
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" -----------------------------------------------------------------------------
" CoC Explorer (File Tree)
" -----------------------------------------------------------------------------
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>

" Auto-close explorer if it's the last window
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" -----------------------------------------------------------------------------
" Prettier Formatting
" -----------------------------------------------------------------------------
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Auto-format on save for specific file types
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.sol,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" -----------------------------------------------------------------------------
" Visual Mode Enhancements
" -----------------------------------------------------------------------------
" Prevent delete from overwriting clipboard
vnoremap p "_dP

" Replace all occurrences of selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" -----------------------------------------------------------------------------
" Theme Toggle
" -----------------------------------------------------------------------------
" Toggle between light and dark background
nnoremap <leader>bg :let &background = (&background == "dark" ? "light" : "dark")<CR>
