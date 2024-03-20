local M = {}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "bash-language-server",

    "clangd",
  },
}

M.lspconfig = {
  servers = {
    -- "lua_ls", -- added by default by nvchad
    "bashls",

    "clangd",
  }
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "vimdoc",

    "lua",

    "bash",

    "c",
    "cpp",
  },
}

return M
