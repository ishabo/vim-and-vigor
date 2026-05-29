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

" Load CoC workspace folders from a VS Code .code-workspace file
lua <<EOF
local function _strip_jsonc(content)
  content = content:gsub("//[^\n\r]*", "")
  content = content:gsub(",%s*([}%]])", "%1")
  return content
end

function _G.LoadCocWorkspaceFromCodeWorkspace(workspace_file)
  local expanded = vim.fn.expand(workspace_file)
  local ok_read, lines = pcall(vim.fn.readfile, expanded)
  if not ok_read or not lines or #lines == 0 then
    vim.notify("Could not read workspace file: " .. expanded, vim.log.levels.ERROR)
    return
  end

  local raw = table.concat(lines, "\n")
  local cleaned = _strip_jsonc(raw)
  local ok, decoded = pcall(vim.fn.json_decode, cleaned)
  if not ok or type(decoded) ~= "table" then
    vim.notify("Invalid workspace JSON: " .. expanded, vim.log.levels.ERROR)
    return
  end

  local workspace_dir = vim.fn.fnamemodify(expanded, ":p:h")
  local folders = {}
  for _, folder in ipairs(decoded.folders or {}) do
    local folder_path = folder.path
    if type(folder_path) == "string" and folder_path ~= "" then
      local absolute
      if folder_path:sub(1, 1) == "/" then
        absolute = folder_path
      else
        absolute = workspace_dir .. "/" .. folder_path
      end
      local resolved = vim.fn.fnamemodify(vim.fn.expand(absolute), ":p")
      resolved = resolved:gsub("/+$", "")
      if resolved == "" then resolved = "/" end
      table.insert(folders, resolved)
    end
  end

  if #folders == 0 then
    vim.notify("No folders found in workspace: " .. expanded, vim.log.levels.WARN)
    return
  end
  local previous = {}
  if type(vim.g.WorkspaceFolders) == "table" then
    for _, folder in ipairs(vim.g.WorkspaceFolders) do
      table.insert(previous, folder)
    end
  end
  vim.g.WorkspaceFolders = folders

  if vim.fn.exists("*CocAction") ~= 1 then
    vim.notify("Saved g:WorkspaceFolders; CoC is not available in this session", vim.log.levels.WARN)
    return
  end

  if vim.g.coc_service_initialized ~= 1 then
    vim.notify("Saved g:WorkspaceFolders; run :CocRestart to apply now", vim.log.levels.INFO)
    return
  end
  for _, folder in ipairs(previous) do
    pcall(vim.fn.CocAction, "removeWorkspaceFolder", folder)
  end

  local failures = 0
  for _, folder in ipairs(folders) do
    local ok_add = pcall(vim.fn.CocAction, "addWorkspaceFolder", folder)
    if not ok_add then
      failures = failures + 1
    end
  end

  if failures > 0 then
    vim.notify("Workspace folders saved, but some folders failed to attach", vim.log.levels.WARN)
    return
  end
  vim.notify("Loaded " .. tostring(#folders) .. " CoC workspace folders", vim.log.levels.INFO)
end
EOF

command! -nargs=1 CocLoadWorkspace lua LoadCocWorkspaceFromCodeWorkspace(<q-args>)
