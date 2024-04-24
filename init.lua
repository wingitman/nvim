vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "hrsh7th/nvim-cmp", name = "nvim-cmp", priority = 1000 },
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" } , -- not strictly required, but recommended
  { "MunifTanjim/nui.nvim" },
  { "nvim-neo-tree/neo-tree.nvim", name = "neo-tree" },

  { "neovim/node-client" }

}
local opts = {}


require("lazy").setup(plugins,opts)
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
print("hello world!")




