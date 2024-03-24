require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map(
  "v",
  "<leader>fm",
  '<ESC><cmd>lua require("conform").format { lsp_fallback = true } <CR>',
  { desc = "Format Files" }
)

-- Unmap keys
map("n", "<Tab>", "<C-i>")
map("n", "<S-tab>", "<Nop>")

map("t", "<ESC>", "<Nop>")

-- Switch tabs
map("n", "<M-}>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<M-{>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

-- Back and forward
map("n", "<M-]>", "<C-i>")
map("n", "<M-[>", "<C-o>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
