-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local csharp_folding = vim.api.nvim_create_augroup("csharp_folding", { clear = true })

local function use_treesitter_folds(args)
  local buf = args.buf

  if vim.bo[buf].filetype ~= "cs" and vim.bo[buf].filetype ~= "csharp" then
    return
  end

  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  vim.opt_local.foldenable = true
  vim.opt_local.foldlevel = 99
  vim.opt_local.foldlevelstart = 99
end

vim.api.nvim_create_autocmd("FileType", {
  group = csharp_folding,
  pattern = { "cs", "csharp" },
  callback = use_treesitter_folds,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = csharp_folding,
  callback = use_treesitter_folds,
})
