local M = {}

M.ui = {
  theme = "catppuccin",

  statusline = {
    separator_style = "default",
  },

  cmp = {
    style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
  },

  lsp = {
    signature = false,
    semantic_tokens = false,
  },

  tabufline = {
    lazyload = false,
    order = { "treeOffset", "buffers", "tabs" },
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M
