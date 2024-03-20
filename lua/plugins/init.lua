return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        enable = true
      })
    end,
    lazy = false
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
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      mapping = {
        ["<up>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Select }),
        ["<down>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Select }),

        ["<Tab>"] = require("cmp").mapping(function(fallback)
          if require("cmp").visible() then
            local entry = require("cmp").get_selected_entry()
            if not entry then
              require("cmp").select_next_item({ behavior = require("cmp").SelectBehavior.Select })
            end
            require("cmp").confirm()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = require("cmp").mapping(function(fallback)
          if require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      sources = {
        { name = "nvim_lsp" },
        { name = "copilot" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },

      sorting = {
        priority_weight = 2,
        comparators = {
          require("cmp").config.compare.order,
          require("cmp").config.compare.offset,
          require("cmp").config.compare.exact,
          require("cmp").config.compare.score,
          require("cmp").config.compare.recently_used,
          require("cmp").config.compare.locality,
          require("cmp").config.compare.kind,
          require("cmp").config.compare.length,
        },
      },
    }
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        {
          "folke/neodev.nvim",
          config = function()
            require("neodev").setup({})
          end,
        }
      }
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
      ensure_installed = require("configs.lsp").mason.ensure_installed
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = require("configs.lsp").treesitter.ensure_installed
  	},
  },
}
