return {
  "emmanueltouzery/apidocs.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- or, 'folke/snacks.nvim'
    -- fd --type f --type l --color never -E .git -e markdown -e md . /home/wing/.local/share/nvim/apidocs-data
  },
  cmd = { "ApidocsSearch", "ApidocsInstall", "ApidocsOpen", "ApidocsSelect", "ApidocsUninstall" },
  config = function()
    require("apidocs").setup()
    -- Picker will be auto-detected. To select a picker of your choice explicitly you can set picker by the configuration option 'picker':
    -- require('apidocs').setup({picker = "snacks"})
    -- Possible options are 'ui_select', 'telescope', and 'snacks'
  end,
  keys = {
    { "<leader>dg", "<cmd>ApidocsOpen<cr>", desc = "Search Api Doc" },
    { "<leader>di", "<cmd>ApidocsInstall<cr>", desc = "Install Api Doc" },
  },
}
