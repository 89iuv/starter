require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.ignorecase = true
vim.opt.wrap = false

vim.opt.pumheight = 10

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove { "r", "o" }
  end,
})
