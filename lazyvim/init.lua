vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("SourcePre", {
  callback = function(args)
    print("SourcePre:", args.file)
  end,
})

require("config.lazy")
require("lazy").setup("plugins")