
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set nowrap")
vim.cmd("set scrolloff=999")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

--TMUX NAVIGATION KEYBINDS:
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end
LineNumberColors()
--OTHER KEYBINDS:
--[[
<leader>dd - diagnost open_float
<leader>cf - lsp.buf.format
<leader>cr - lsp.buf.references
<leader>ca - lsp.buf.code_actions
<leader>cd - lsp.buf.definitions
<leader>ch - lsp.buf.hover
<leader>g - vim-test TestVisit
<leader>l - .. TestLast
<leader>a - .. TestSuite
<leader>T - .. TestFile
<leader>t - .. TestNearest
<leader>hj - Harpoon ..
<leader>hk - .. ..
<leader> hh - open
<leader> hr - remove page
<leader>ha - add page
<leader>cf - lsp.buf.format
<leader>db - dap.continue (debugger open)
<leader>p - find_files
<leader>fg - live_grep

]]
