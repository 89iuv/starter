return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local nvchadOpts = require "nvchad.configs.nvimtree"
      local customOpts = {
        renderer = {
          root_folder_label = ":~:s?$?/..?",
        },
      }
      return vim.tbl_deep_extend("force", nvchadOpts, customOpts)
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      cmdline = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
      popupmenu = {
        enabled = false,
      },
    },
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      -- config
      require("auto-save").setup {
        enable = true,
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
        enabled = false,
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        layout = {
          position = "right", -- | top | left | right
          ratio = 0.4,
        },
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

  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
}
