if true then
  return {}
end
return {
  "wingitman/MotionSensei",
  event = "VeryLazy",
  config = function()
    require("motion-sensei").setup({
      -- Enable/disable the plugin
      enabled = true,

      -- Display settings
      display = {
        position = "eol", -- "eol" | "inline" | "right_align"
        timeout = 6000, -- ms before hint disappears (0 = manual dismiss)
        prefix = " -> Try: ", -- text shown before suggestion
        highlight = "MotionSenseiHint",
        key_highlight = "MotionSenseiKey", -- highlight for the motion key
        style = "virtual_text", -- "virtual_text" | "float"
        clear_on_motion = false, -- don't clear when cursor moves
        clear_on_mode_change = true,
      },

      -- Detection thresholds
      thresholds = {
        repeated_motion = 3, -- minimum repeats before suggesting count
        idle_timeout = 500, -- ms to wait before analyzing
      },

      -- Analysis settings
      analysis = {
        min_savings = 1, -- minimum keystrokes to save
        prefer_text_objects = true, -- prioritize text object suggestions
      },

      -- Enable/disable specific suggestion types
      suggestions = {
        counts = true, -- jjjj -> 4j
        text_objects = true, -- vi", vaw, etc.
        find_motion = true, -- f/F/t/T motions
        line_motions = true, -- $, ^, 0
        paragraph_motions = true, -- {, }, gg, G
        match_pairs = true, -- % for matching brackets
      },

      -- Motion browser settings
      lookup = {
        enable_browser = true,
        enable_search = true,
      },

      -- Statistics settings
      stats = {
        enabled = true,
        persist = true, -- save to disk
        retention_days = 30,
      },

      -- Filetypes where suggestions are disabled
      disabled_filetypes = {
        "help",
        "NvimTree",
        "neo-tree",
        "lazy",
        "mason",
        "TelescopePrompt",
      },

      disabled_buftypes = {
        "nofile",
        "prompt",
        "terminal",
        "quickfix",
      },
    })
    vim.api.nvim_set_hl(0, "MotionSenseiHint", { fg = "#7aa2f7", italic = true })
    vim.api.nvim_set_hl(0, "MotionSenseiKey", { fg = "#9ece6a", bold = true })
  end,
}
