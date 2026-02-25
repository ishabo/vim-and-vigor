" Set runtime paths
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

" Source the Vim configuration
source ~/.vimrc

" Add Treesitter configuration using Lua (only if installed)
lua <<EOF
local has_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')
if has_treesitter then
  treesitter.setup {
    ensure_installed = { "javascript", "typescript", "tsx", "json", "html", "css" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  }
end
EOF
