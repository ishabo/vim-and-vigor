" ============================================================================
" Language-Specific Settings
" ============================================================================

" -----------------------------------------------------------------------------
" CoC Extensions
" -----------------------------------------------------------------------------
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-explorer',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-tailwindcss',
  \ 'coc-pyright',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-marketplace',
  \ 'coc-json',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-graphql',
  \ 'coc-solargraph',
  \ ]

" -----------------------------------------------------------------------------
" CoC Explorer Presets
" -----------------------------------------------------------------------------
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" -----------------------------------------------------------------------------
" FZF Configuration
" -----------------------------------------------------------------------------
let g:fzf_preview_window = ['right:50%', 'ctrl-_']
let g:fzf_buffers_jump = 1  " Jump to existing window if buffer is already open
" Prefer ripgrep (respects .gitignore). :Ag kept as an alias for muscle memory.
" with_preview expects string args, not a List — splat via call().
" rg exits 1 on zero matches; || true keeps fzf from showing "Command failed".
if executable('rg')
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- '
    \   .shellescape(<q-args>).' || true',
    \   1,
    \   call('fzf#vim#with_preview', g:fzf_preview_window),
    \   <bang>0)
else
  command! -bang -nargs=* Rg
    \ echoerr 'rg (ripgrep) not found — run: brew install ripgrep'
endif
command! -bang -nargs=* Ag execute 'Rg'.(<bang>0 ? '!' : '') <q-args>

" -----------------------------------------------------------------------------
" JavaScript/TypeScript
" -----------------------------------------------------------------------------
let g:javascript_plugin_flow = 1
let g:typescript_indent_disable = 1

" Set filetype for TSX/JSX files
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" -----------------------------------------------------------------------------
" Python
" -----------------------------------------------------------------------------
let g:python_highlight_all = 1

" Disable auto format on save for Python (use manual formatting)
autocmd FileType python let b:coc_format_on_save = 0

" -----------------------------------------------------------------------------
" Golang
" -----------------------------------------------------------------------------
" Disable linters (CoC handles this)
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
let g:go_jump_to_error = 0

" Auto-format with goimports on save
let g:go_fmt_command = "goimports"

" Disable auto-highlight (can be slow)
let g:go_auto_sameids = 0

" Syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Go-specific indentation (tabs, not spaces)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=4

" Go keybindings (only active in .go files)
autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)
autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
autocmd BufEnter *.go nmap <leader>c  <Plug>(go-coverage-toggle)
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <leader>ii <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>ci <Plug>(go-describe)
autocmd BufEnter *.go nmap <leader>cc <Plug>(go-callers)

" -----------------------------------------------------------------------------
" Rust
" -----------------------------------------------------------------------------
let g:rustfmt_autosave = 1

" Rust keybindings (only active in .rs files)
autocmd BufEnter *.rs nmap <leader>t :TestNearest<CR>
autocmd BufEnter *.rs nmap <leader>tt :TestFile<CR>

" -----------------------------------------------------------------------------
" Universal Navigation (works across languages)
" -----------------------------------------------------------------------------
nmap <leader>cr <Plug>(coc-references)    " Find references
nmap <C-a> <C-o>                          " Go back
nmap <C-d> <Plug>(coc-definition)         " Go to definition
