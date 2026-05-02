return {
  "wingitman/lup.nvim",
  event = "BufReadPost",
  cmd = { "LupSummarise", "LupSummariseForce", "LupLookup", "LupIndex", "LupStatus" },
  -- Declare the keymap here so lazy.nvim loads the plugin when it is pressed,
  -- but leave the actual mapping to setup() below — no rhs here avoids conflict.
  keys = {
    { "<leader>lu", mode = { "n", "v" }, desc = "Lup: look up word / selection" },
  },
  config = function()
    require("lup").setup({
      -- Path to the lup binary. Defaults to "lup" (assumes $PATH).
      bin = "lup",

      -- Automatically summarise files in the background when opened.
      -- Only runs for supported file types: .go .py .js .ts .jsx .tsx
      auto_summarise = true,

      -- Keymap to trigger a lookup.
      --   Normal mode: looks up the word under the cursor.
      --   Visual mode: looks up the selected text.
      lookup_keymap = "<leader>lu",

      -- Floating window border style.
      -- Valid values: "none", "single", "double", "rounded", "solid", "shadow"
      border = "rounded",

      -- Floating window transparency (0 = opaque, 100 = fully transparent).
      winblend = 0,

      -- Number of RAG results to show in the lookup float.
      -- 0 = defer to top_k in lup's own config.toml (recommended).
      top_k = 0,
    })
  end,
}
