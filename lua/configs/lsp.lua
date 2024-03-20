local M = {}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "bash-language-server",
  },
}

M.lspconfig = {
  servers = {
    -- "lua_ls", -- added by default by nvchad
    "bashls"
  }
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "vimdoc",

    "lua",

    "bash",
  },
}

return M
