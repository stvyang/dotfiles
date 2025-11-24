-- lua/plugins/init.lua
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
    config = function()
      -- Capabilities (for nvim-cmp)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Simple on_attach with a few keymaps
      local function on_attach(client, bufnr)
        local bufmap = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
        end

        bufmap("n", "gd", vim.lsp.buf.definition, "Goto Definition")
        bufmap("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
        bufmap("n", "gi", vim.lsp.buf.implementation, "Goto Implementation")
        bufmap("n", "gr", vim.lsp.buf.references, "Goto References")
        bufmap("n", "K", vim.lsp.buf.hover, "Hover")
        bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
        bufmap("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
        bufmap("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, "Format buffer")
      end

      -- Define configs for each server
      local servers = { "gopls", "pyright", "ts_ls", "lua_ls", "rust_analyzer" }
      for _, server in ipairs(servers) do
        vim.lsp.config[server] = {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end

      -- Per-language tweaks (optional)
      vim.lsp.config.lua_ls.settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      }

      -- Auto-start correct LSP based on filetype
      vim.api.nvim_create_autocmd("BufReadPost", {
        callback = function(args)
          local bufnr = args.buf
          local ft = vim.bo[bufnr].filetype

          local map = {
            go = "gopls",
            python = "pyright",
            lua = "lua_ls",
            javascript = "ts_ls",
            typescript = "ts_ls",
            typescriptreact = "ts_ls",
            tsx = "ts_ls",
            rust = "rust_analyzer",
          }

          local server = map[ft]
          if server and vim.lsp.config[server] then
            vim.lsp.start(vim.lsp.config[server], { bufnr = bufnr })
          end
        end,
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Completion (nvim-cmp)
  ---------------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        }),
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- Telescope: fuzzy finder
  ---------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },

  ---------------------------------------------------------------------------
  -- which-key: keybinding helper popup
  ---------------------------------------------------------------------------
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },

  ---------------------------------------------------------------------------
  -- Treesitter: better syntax + AST
  ---------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "go",
          "python",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "bash",
          "yaml",
          "markdown",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },


  ---------------------------------------------------------------------------
  -- nvim-tree: file explorer
  ---------------------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
      { "<leader>t", "<cmd>NvimTreeFindFile<CR>", desc = "Locate file in tree" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 35,
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
        },
      })
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  ---------------------------------------------------------------------------
  -- Devicons (icons for NvimTree, Telescope, etc.)
  ---------------------------------------------------------------------------
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  ---------------------------------------------------------------------------
  -- Autopairs
  ---------------------------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({})

      -- integrate with nvim-cmp if available
      local ok_cmp, cmp = pcall(require, "cmp")
      if ok_cmp then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },
}