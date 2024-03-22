local M = {}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "bash-language-server",

    "clangd",

    "typescript-language-server",
    "prettier",
  },
}

M.lspconfig = {
  servers = {
    "lua_ls",

    "bashls",

    "clangd",

    "tsserver",
  },
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

M.conform = {
  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettier" },
    typescript = { "prettier" },

    -- css = { "prettier" },
    -- html = { "prettier" },
  },
}

return M
