local walker_path = "/run/media/wing/860 Evo 1TB/Work/Walker"

return {
  dir = walker_path,
  name = "walker.nvim",
  main = "walker",
  lazy = false, -- Make :WalkerTask available immediately.

  keys = {
    { "<leader>cwp", "<cmd>WalkerPanel<cr>", desc = "Walker Tasks and Usage" },
    { "<leader>cwt", ":WalkerTask<cr>", mode = "x", desc = "Walker Task from Selection" },
    { "<leader>cwr", "<cmd>WalkerRun<cr>", desc = "Walker Run" },
    { "<leader>cwc", "<cmd>WalkerCancel<cr>", desc = "Walker Cancel" },
  },

  opts = {
    command = { "python3", walker_path .. "/adapters/openai_agent.py" },
    brief = "Preserve my voice. Keep changes focused. Ask when essential context is missing.",
    panel = { width = 44 },
    balance = { enabled = true, refresh_seconds = 60 },
    triggers = {
      directive = true,
      save = true,
      interval = true,
      idle = true,
    },
  },
}
