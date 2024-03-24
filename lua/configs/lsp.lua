local M = {}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "bash-language-server",
    "shfmt",
    "shellcheck";

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

    sh = { "shfmt", "shellcheck" },

    javascript = { "prettier" },
    typescript = { "prettier" },

    -- css = { "prettier" },
    -- html = { "prettier" },
  },
}

return M
