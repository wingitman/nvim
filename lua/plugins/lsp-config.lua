return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "pyright",
          "sqlls",
          "csharp_ls",
          "html",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.pyright.setup({})
      lspconfig.sqlls.setup({})
      lspconfig.csharp_ls.setup({})
      lspconfig.html.setup({})
      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})

      -- setup diagnostics
      vim.diagnostic.config({ virtual_text = false })
      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        callback = function()
          if vim.lsp.buf.server_ready() then
            vim.diagnostic.open_float()
          end
        end,
      })

      -- set up LSP signs
      for type, icon in pairs({
        Error = "",
        Warn = "",
        Hint = "",
        Info = "",
      }) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
      --vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float(), {})
    end
  }

}
