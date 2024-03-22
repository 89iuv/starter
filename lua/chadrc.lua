local M = {}

M.ui = {
  theme = "catppuccin",

  statusline = {
    separator_style = "block",
  },

  cmp = {
    style = "flat_light", -- default/flat_light/flat_dark/atom/atom_colored
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M
