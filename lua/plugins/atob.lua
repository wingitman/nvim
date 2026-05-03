return {
  "wingitman/atob.nvim",
  keys = {
    { "<leader>ab", mode = { "v" }, desc = "Convert from atob" },
  },
  config = function()
    require("atob").setup({
      binary = "atob",
    })
  end,
}
