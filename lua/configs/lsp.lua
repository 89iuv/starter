local M = {}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "bash-language-server",

    "clangd",

    "typescript-language-server",
  },
}

M.lspconfig = {
  servers = {
    -- "lua_ls", -- added by default by nvchad
    "bashls",

    "clangd",

    "tsserver",
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

    "javascript",
    "typescript",
  },
}

return M
