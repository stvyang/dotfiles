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
}