return {
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
  -- Devicons (icons for NvimTree, Telescope, etc.)
  ---------------------------------------------------------------------------
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
      require('onedark').load()
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          refresh = { refresh_time = 16 }, -- ~60fps (only non-default setting)
        }
      }
    end,
  },

  ---------------------------------------------------------------------------
  -- OpenCode integration
  ---------------------------------------------------------------------------
  {
    "NickvanDyke/opencode.nvim",
    config = function()
      -- Configuration via global variable
      vim.g.opencode_opts = {
        -- Will use tmux if inside tmux session, otherwise needs manual opencode instance
      }

      -- Required for auto-reloading files edited by opencode
      vim.o.autoread = true

      -- Recommended keymaps
      vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end, { desc = "Execute opencode action…" })
      vim.keymap.set({ "n", "x" }, "ga", function() require("opencode").prompt("@this") end, { desc = "Add to opencode" })
      vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
      vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end, { desc = "opencode half page up" })
      vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })

      -- Restore original increment/decrement since we use <C-a> and <C-x>
      vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment', noremap = true })
      vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement', noremap = true })
    end,
  },
}