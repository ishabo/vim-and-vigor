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
" Git
" -----------------------------------------------------------------------------
if has('nvim')
  nnoremap ]h :Gitsigns next_hunk<CR>
  nnoremap [h :Gitsigns prev_hunk<CR>
  nnoremap <leader>gb :Git blame<CR>
  nnoremap <leader>gt :Gitsigns toggle_current_line_blame<CR>
  nnoremap <leader>gd :DiffviewOpen<CR>
  nnoremap <leader>gh :DiffviewFileHistory %<CR>
  nnoremap <leader>gq :DiffviewClose<CR>
else
  nmap ]h <Plug>(GitGutterNextHunk)
  nmap [h <Plug>(GitGutterPrevHunk)
  nnoremap <leader>gb :Git blame<CR>
endif

" -----------------------------------------------------------------------------
" CoC Explorer (File Tree)
" -----------------------------------------------------------------------------
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floating<CR>

" Auto-close explorer if it's the last window
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" -----------------------------------------------------------------------------
" Formatting (project-owned via CoC prettier/eslint — no BufWritePre race)
" -----------------------------------------------------------------------------
" Manual full-buffer format when a project Prettier config exists
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Format-on-save is configured only in nvim/coc-settings.json (single path)

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
