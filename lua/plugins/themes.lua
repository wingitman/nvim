return {
  { "catppuccin/nvim" },
  { "eldritch-theme/eldritch.nvim" },
  { "scottmckendry/cyberdream.nvim" },
  { "sainnhe/everforest" },
  { "shaunsingh/nord.nvim" },
  { "Yazeed1s/minimal.nvim" },
  { "rose-pine/neovim" },
  {
    "folke/tokyonight.nvim",
    config = function()
      --vim.cmd.colorscheme "rose-pine"
      --vim.cmd.colorscheme "minimal"
      --vim.cmd.colorscheme "nord"
      --vim.cmd.colorscheme "everforest"
      --vim.cmd.colorscheme "eldritch"
      --vim.cmd.colorscheme "cyberdream"
      vim.cmd.colorscheme "tokyonight"
      --vim.cmd.colorscheme "catppuccin"
    end
  },
}
