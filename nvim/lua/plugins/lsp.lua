return {
  ---------------------------------------------------------------------------
  -- Mason: external tooling manager (LSP servers, formatters, linters, etc.)
  ---------------------------------------------------------------------------
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "pyright", "rust_analyzer", "ts_ls", "lua_ls" },
        automatic_installation = true,
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- LSP core
  ---------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      -- Capabilities (for nvim-cmp)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Setup basic server configurations using modern vim.lsp.config API
      local servers = {
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        ts_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
        },
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config[server] = config
      end

      -- LspAttach autocommand for keymaps (more reliable than on_attach)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          print("LspAttach triggered for buffer:", ev.buf) -- Debug message

          local bufmap = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc, silent = true })
          end

          -- Helper function to safely call telescope LSP functions
          local safe_telescope_call = function(func, fallback_func, error_msg)
            return function()
              local ok, err = pcall(func)
              if not ok then
                if fallback_func then
                  fallback_func()
                else
                  vim.notify(error_msg or "LSP function not available", vim.log.levels.WARN)
                end
              end
            end
          end

          -- Check if telescope is available and get builtin functions
          local telescope_available, telescope_builtin = pcall(require, "telescope.builtin")

          if telescope_available then
            -- Core navigation functions (most commonly supported)
            bufmap("n", "gd", function() telescope_builtin.lsp_definitions() end, "Goto Definition")
            bufmap("n", "gr", function() telescope_builtin.lsp_references() end, "Goto References")

            -- Implementation with fallback (not all servers/symbols support this)
            bufmap("n", "gi", safe_telescope_call(
              telescope_builtin.lsp_implementations,
              vim.lsp.buf.implementation,
              "No implementations found"
            ), "Goto Implementation")

            -- Type definitions with fallback (Go doesn't typically use this much)
            bufmap("n", "gt", safe_telescope_call(
              telescope_builtin.lsp_type_definitions,
              nil,
              "Type definitions not supported or not found"
            ), "Goto Type Definition")

            -- Symbol browsing
            bufmap("n", "<leader>ds", function() telescope_builtin.lsp_document_symbols() end, "Document Symbols")
            bufmap("n", "<leader>ws", function() telescope_builtin.lsp_workspace_symbols() end, "Workspace Symbols")

            -- Diagnostics (telescope has this)
            bufmap("n", "<leader>e", function() telescope_builtin.diagnostics() end, "Show Diagnostics")
          else
            -- Fallback to regular LSP functions if telescope not available
            bufmap("n", "gd", vim.lsp.buf.definition, "Goto Definition")
            bufmap("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
            bufmap("n", "gr", vim.lsp.buf.references, "Goto References")
          end

          -- These always use standard LSP (no telescope equivalent)
          bufmap("n", "K", vim.lsp.buf.hover, "Hover")
          bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
          bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

          -- Diagnostics navigation
          bufmap("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev Diagnostic")
          bufmap("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next Diagnostic")
        end,
      })
    end,
  },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}