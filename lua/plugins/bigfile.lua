return {
  "LunarVim/bigfile.nvim",
  config = function()
    -- default config
    require("bigfile").setup {
      filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
      pattern = { "*.json" }, -- autocmd pattern or function see <### Overriding the detection of big files>
      features = { -- features to disable
        "indent_blankline",
        "illuminate",
        "MotionSensei",
        "keystrokes",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
      },
    }
    print('Big File')
  end
}
