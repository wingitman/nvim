-- Language-specific configurations for .NET, Angular, JSON, and SQL
-- This file extends the LazyVim extras with custom settings

return {
  -- Disable format-on-save globally (format manually with <leader>cf)
  {
    "LazyVim/LazyVim",
    opts = {
      format = {
        autoformat = false, -- Disable format-on-save
      },
    },
  },

  -- Ensure all required Mason tools are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- C# / .NET
        "omnisharp",
        "csharpier",
        "netcoredbg",

        -- TypeScript / Angular
        "typescript-language-server",
        "angular-language-server",
        "prettierd",
        "prettier",
        "eslint-lsp",
        "js-debug-adapter",

        -- JSON
        "json-lsp",

        -- SQL (T-SQL)
        "sqlfluff",
        "sql-formatter",

        -- General
        "stylua",
        "shfmt",
        "marksman",
      },
    },
  },

  -- Configure sqlfluff for T-SQL (SQL Server) dialect
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        sqlfluff = {
          args = {
            "lint",
            "--format=json",
            "--dialect=tsql",
            "-",
          },
        },
      },
    },
  },

  -- Configure conform.nvim for T-SQL formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        sqlfluff = {
          args = { "format", "--dialect=tsql", "-" },
        },
      },
    },
  },

  -- Ensure treesitter parsers are installed for all languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- C#
        "c_sharp",

        -- TypeScript / Angular
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
        "scss",
        "angular",

        -- JSON
        "json",
        "json5",
        "jsonc",

        -- SQL
        "sql",

        -- General
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "regex",
        "bash",
        "yaml",
        "xml",
      },
    },
  },

  -- Configure omnisharp for better .NET Framework 4.6.2 support
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          -- Enable Roslyn analyzers for better code analysis
          enable_roslyn_analyzers = true,
          -- Organize imports on format
          organize_imports_on_format = true,
          -- Enable import completion
          enable_import_completion = true,
          -- Enable decompilation support (go to definition in framework code)
          enable_decompilation_support = true,
          -- Analyze open documents only (better performance)
          analyze_open_documents_only = false,
        },
      },
    },
  },

  -- DAP (Debug Adapter Protocol) configuration for .NET
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      -- .NET Core / .NET Framework debugging with netcoredbg
      if not dap.adapters["netcoredbg"] then
        dap.adapters["netcoredbg"] = {
          type = "executable",
          command = vim.fn.exepath("netcoredbg"),
          args = { "--interpreter=vscode" },
        }
      end

      -- Default .NET debug configurations
      for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
        if not dap.configurations[lang] then
          dap.configurations[lang] = {
            {
              type = "netcoredbg",
              name = "Launch - .NET Core",
              request = "launch",
              program = function()
                return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
              end,
            },
            {
              type = "netcoredbg",
              name = "Attach - .NET Core",
              request = "attach",
              processId = require("dap.utils").pick_process,
            },
          }
        end
      end
    end,
  },

  -- DAP configuration for JavaScript/TypeScript/Angular (fix Windows paths)
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")

      -- Mason's data path for installed tools (Windows compatible)
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
      local js_debug_path = mason_path .. "/js-debug-adapter/js-debug/src/dapDebugServer.js"

      -- Normalize path for Windows
      if vim.fn.has("win32") == 1 then
        js_debug_path = js_debug_path:gsub("/", "\\")
      end

      -- Override pwa-node adapter with correct Windows path
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { js_debug_path, "${port}" },
        },
      }

      -- Override pwa-chrome adapter with correct Windows path
      dap.adapters["pwa-chrome"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { js_debug_path, "${port}" },
        },
      }

      -- Helper function to detect Angular port from angular.json
      local function get_angular_url()
        local port = 4200 -- default Angular port

        local angular_json = vim.fn.getcwd() .. "/angular.json"
        if vim.fn.filereadable(angular_json) == 1 then
          local content = vim.fn.readfile(angular_json)
          local json_str = table.concat(content, "")
          local custom_port = json_str:match('"port"%s*:%s*(%d+)')
          if custom_port then
            port = tonumber(custom_port)
          end
        end

        return "http://localhost:" .. port
      end

      -- Add Angular-specific Chrome debug configurations
      local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

      for _, lang in ipairs(js_filetypes) do
        dap.configurations[lang] = dap.configurations[lang] or {}

        -- Check if our Angular config already exists to avoid duplicates
        local has_angular_config = false
        for _, config in ipairs(dap.configurations[lang]) do
          if config.name == "Launch Chrome (Angular)" then
            has_angular_config = true
            break
          end
        end

        if not has_angular_config then
          -- Insert at beginning so Angular options appear first
          table.insert(dap.configurations[lang], 1, {
            type = "pwa-chrome",
            name = "Launch Chrome (Angular)",
            request = "launch",
            url = get_angular_url,
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
            sourceMapPathOverrides = {
              ["webpack:///./~/*"] = "${workspaceFolder}/node_modules/*",
              ["webpack://?:*/*"] = "${workspaceFolder}/*",
            },
          })

          table.insert(dap.configurations[lang], 2, {
            type = "pwa-chrome",
            name = "Attach to Chrome (port 9222)",
            request = "attach",
            port = 9222,
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
          })
        end
      end
    end,
  },
}
