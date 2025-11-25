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

          -- Core LSP keymaps (most commonly supported)
          bufmap("n", "gd", vim.lsp.buf.definition, "Goto Definition")
          bufmap("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
          bufmap("n", "gr", vim.lsp.buf.references, "Goto References")
          bufmap("n", "K", vim.lsp.buf.hover, "Hover")
          bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
          bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

          -- Diagnostics are always available
          bufmap("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev Diagnostic")
          bufmap("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next Diagnostic")

          -- Note: Removed gD (declaration) as it's not supported by most servers like gopls
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