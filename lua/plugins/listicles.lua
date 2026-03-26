return {
  "wingitman/listicles.nvim",
  cmd = { "Listicles", "ListiclesToggle" },
  keys = {
    { "<leader>e", "<cmd>ListiclesToggle<cr>", desc = "Open Listicles" },
  },
  config = function()
    require("listicles").setup({
      -- Path to the listicles binary (default: "listicles" from $PATH).
      bin         = "listicles",

      -- Floating window dimensions as fraction of editor size.
      width       = 0.85,
      height      = 0.85,

      -- Border style: "rounded", "single", "double", "shadow", "none", …
      border      = "rounded",

      -- Window transparency 0–100 (0 = opaque). Requires a compositor.
      winblend    = 0,

      -- How to open a selected file:
      --   "edit"    current window
      --   "split"   horizontal split
      --   "vsplit"  vertical split
      --   "tabedit" new tab
      open_action = "edit",

      -- How to cd when a directory is selected:
      --   "lcd"  window-local (default, safest)
      --   "tcd"  tab-local
      --   "cd"   global
      --   false  disable
      cd_action   = "lcd",

      -- Keymap to toggle listicles. Set to false to disable.
      keymap = "<leader>e",
    })
    vim.api.nvim_set_hl(0, "ListiclesBorder", { fg = "#7aa2f7" })
  end,
}
