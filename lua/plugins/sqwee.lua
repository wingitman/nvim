return {
  "wingitman/sqwee.nvim",
  keys = {
    { "<leader>sq", "<cmd>Sqwee<cr>", desc = "Sqwee" },
  },
  cmd = { "Sqwee", "SqweeToggle" },
  config = function()
    require("sqwee").setup()
  end,
}
