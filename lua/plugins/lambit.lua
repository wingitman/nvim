return {
  "wingitman/lambit.nvim",
  keys = {
    { "<leader>lao", "<cmd>Lambit<cr>", desc = "Lambit" },
    { "<leader>lat", "<cmd>LambitToggle<cr>", desc = "LambitToggle" },
  },
  cmd = { "Lambit", "LambitToggle", "LambitClose", "LambitOpen" },
  config = function()
    require("lambit").setup({
      binary = "lambit",
    })
  end,
}
