-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Use native clipboard
vim.opt.clipboard = "unnamedplus"

-- Map
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Move to start/end of line (H/L)
map("n", "H", "^", opts)
map("n", "L", "$", opts)

-- Disable default start/end line keys
map("n", "$", "<nop>", opts)
map("n", "^", "<nop>", opts)

-- Insert new line below/above without entering insert mode
map("n", "<leader>j", "o<Esc>", opts)
map("n", "<leader>k", "O<Esc>", opts)

-----------------------------------------------------------
-- System Operations
-----------------------------------------------------------
-- Save file (<C-s>)
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)

-- Quit file (<C-q>)
map("n", "<C-q>", ":q<CR>", opts)

-----------------------------------------------------------
-- Window Management
-----------------------------------------------------------
-- Resize vertical splits
map("n", "<leader>=", ":vertical resize +5<CR>", opts)
map("n", "<leader>-", ":vertical resize -5<CR>", opts)

-----------------------------------------------------------
-- Buffer Management
-----------------------------------------------------------
-- Navigate buffers
map("n", "<leader>n", ":bn<CR>", opts)
map("n", "<leader>b", ":bp<CR>", opts)

-----------------------------------------------------------
-- Search & Replace
-----------------------------------------------------------
-- Replace keyword (Start command)
map("n", "<leader>r", ":%s/", { desc = "Search and Replace" })

-- Turn off search highlight
map("n", "<leader><space>", ":nohlsearch<CR>", opts)

-----------------------------------------------------------
-- Utilities
-----------------------------------------------------------
-- Copy relative file path
map("n", "<F3>", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify("Copied path: " .. path)
end, { desc = "Copy relative path" })