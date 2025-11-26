local opt = vim.opt

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.clipboard = "unnamedplus" -- Use native clipboard
opt.termguicolors = true      -- Enable truecolor support
opt.hidden = true             -- Preserve buffers when switching
opt.wildmenu = true           -- Enhanced command-line completion
opt.fixendofline = false      -- No <EOL> at end of file

-----------------------------------------------------------
-- UI / Display
-----------------------------------------------------------
opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Show relative line numbers
opt.ruler = true              -- Show line and column stats
opt.laststatus = 2            -- Always show status line
opt.showcmd = true            -- Show command on last line of screen
opt.showmode = true           -- Show mode on last line of screen
opt.cursorline = true         -- Highlight current line
opt.showmatch = true          -- Highlight matching [{()}]

-----------------------------------------------------------
-- Indentation & Tabs (Global Defaults)
-----------------------------------------------------------
opt.tabstop = 2               -- Number of visual spaces per tab
opt.softtabstop = 2           -- Number of spaces per tab when pressing TAB
opt.shiftwidth = 2            -- Number of spaces per tab when pressing >>, << or ==
opt.expandtab = true          -- Tabs are spaces
opt.autoindent = true         -- Use indent of current line when opening new line

-----------------------------------------------------------
-- Split Behavior
-----------------------------------------------------------
opt.splitbelow = true         -- Vertical split pane to below
opt.splitright = true         -- Horizontal split pane to right

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
opt.hlsearch = true           -- Highlight search matches
opt.incsearch = true          -- Show where the search pattern matches as you type
opt.ignorecase = true         -- Case insensitive search
opt.smartcase = true          -- If search contains uppercase, it's case sensitive

-----------------------------------------------------------
-- Filetype Specific Overrides (Autocommands)
-----------------------------------------------------------

-- Create a group to prevent duplication if you reload config
local vimrc_group = vim.api.nvim_create_augroup("vimrc_autocmds", { clear = true })

-- Golang:
-- Note: Standard Go formatting usually requires Tabs (noexpandtab). 
-- I translated your config exactly (expandtab), but you might want `expandtab = false` for Go.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  group = vimrc_group,
  callback = function()
    vim.opt_local.tabstop = 8
    vim.opt_local.softtabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.expandtab = false
  end,
})