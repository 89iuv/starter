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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
