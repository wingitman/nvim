return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- setup syntax highlighting
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "javascript", "go", "c", "css", "html" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
