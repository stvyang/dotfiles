return {
  ---------------------------------------------------------------------------
  -- Telescope: fuzzy finder
  ---------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
        pickers = {
          lsp_references = {
            theme = "dropdown",
            show_line = false,
          },
          lsp_definitions = {
            theme = "dropdown",
            show_line = false,
          },
          lsp_implementations = {
            theme = "dropdown",
            show_line = false,
          },
          lsp_type_definitions = {
            theme = "dropdown",
            show_line = false,
          },
          lsp_document_symbols = {
            theme = "dropdown",
          },
          lsp_workspace_symbols = {
            theme = "dropdown",
          },
          diagnostics = {
            theme = "dropdown",
          },
        },
      })
    end,
  },

  ---------------------------------------------------------------------------
  -- which-key: keybinding helper popup
  ---------------------------------------------------------------------------
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },

  ---------------------------------------------------------------------------
  -- nvim-tree: file explorer
  ---------------------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    event = "BufEnter",
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

      -- Automatically open nvim-tree when Neovim starts without arguments
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("NvimTreeOpen") -- Use NvimTreeOpen for the initial start
          vim.cmd("wincmd l") -- Move focus to the right window (editor)
        end
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
}