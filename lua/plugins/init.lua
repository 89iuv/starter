return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      -- config
      require("auto-save").setup {
        enable = true,
        debounce_delay = 1000, -- saves the file at most every `debounce_delay` milliseconds
      }
      -- key bindings
      vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})
    end,
    lazy = false,
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      -- Possible configurable fields can be found on:
      -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
      suggestion = {
        enable = false,
      },
      panel = {
        enable = false,
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        opts = {
          -- Possible configurable fields can be found on:
          -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
          suggestion = {
            enable = false,
          },
          panel = {
            enable = false,
          },
        },
      },
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = function()
      return require "configs.cmp"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        {
          "folke/neodev.nvim",
          config = function()
            require("neodev").setup {}
          end,
        },
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = require("configs.lsp").mason.ensure_installed,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = require("configs.lsp").treesitter.ensure_installed,
    },
  },
}
