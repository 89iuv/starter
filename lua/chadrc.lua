local M = {}

M.ui = {
	theme = "catppuccin",

  statusline = {
    separator_style = "block",
  },

  hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

return M
