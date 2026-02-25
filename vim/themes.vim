" ============================================================================
" Visual Theme & Color Settings
" ============================================================================

" -----------------------------------------------------------------------------
" Color Scheme
" -----------------------------------------------------------------------------
set background=dark
let g:gruvbox_contrast_dark = 'medium'  " Options: soft, medium, hard
let g:gruvbox_italic = 1

" Load Gruvbox if available, fallback to default
try
  colorscheme gruvbox
catch /^Vim\%((\_a\+)\)\=:E185/
  " Gruvbox not installed yet, use default
  colorscheme default
endtry

" -----------------------------------------------------------------------------
" Highlight Settings
" -----------------------------------------------------------------------------
highlight ExtraWhitespace ctermbg=white guibg=white
highlight ColorColumn ctermbg=0 guibg=LightGrey
highlight StatusLine ctermfg=white ctermbg=blue guifg=#ffffff guibg=#0000ff

" Match trailing whitespace
match ExtraWhitespace /\s\+\%#\@<!$/

" -----------------------------------------------------------------------------
" Dynamic Theme Adjustments
" -----------------------------------------------------------------------------
function! AdjustColorscheme()
  let l:scheme = g:colors_name
  
  " Gruvbox-specific adjustments
  if l:scheme ==# 'gruvbox'
    " Subtle adjustments for better readability
    highlight CursorLine guibg=#3c3836
    highlight Visual guibg=#504945
  endif
endfunction

" Run when colorscheme changes
autocmd ColorScheme * call AdjustColorscheme()
" Run on startup
autocmd VimEnter * call AdjustColorscheme()

" -----------------------------------------------------------------------------
" Dim Inactive Windows
" -----------------------------------------------------------------------------
let g:diminactive_use_colorcolumn = 1
let g:inactive_use_syntax = 1
let g:diminactive_enable_focus = 1
let g:diminactive_buftype_blacklist = ['nofile', 'nowrite', 'acwrite', 'quickfix', 'help']

" -----------------------------------------------------------------------------
" DevIcons Configuration
" -----------------------------------------------------------------------------
let g:webdevicons_enable_nerdfont = 1
let g:webdevicons_enable_unite = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Icon colors
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:WebDevIconsDefaultFolderSymbolColor = s:beige
let g:WebDevIconsDefaultFileSymbolColor = s:blue
