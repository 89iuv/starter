local nvchadOpts = require "nvchad.configs.cmp"
local customOpts = {
  mapping = {
    ["<up>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Select },
    ["<down>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Select },

    ["<CR>"] = require("cmp").config.disable,

    ["<Tab>"] = require("cmp").mapping(function(fallback)
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
      end
      if require("cmp").visible() and has_words_before() then
        local entry = require("cmp").get_selected_entry()
        if not entry then
          require("cmp").select_next_item { behavior = require("cmp").SelectBehavior.Select }
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
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,

      -- Below is the default comparitor list and order for nvim-cmp
      require("cmp").config.compare.offset,
      -- require("cmp").config.compare.scopes, --this is commented in nvim-cmp too
      require("cmp").config.compare.exact,
      require("cmp").config.compare.score,
      require("cmp").config.compare.recently_used,
      require("cmp").config.compare.locality,
      require("cmp").config.compare.kind,
      require("cmp").config.compare.sort_text,
      require("cmp").config.compare.length,
      require("cmp").config.compare.order,
    },
  },
}

return vim.tbl_deep_extend("force", nvchadOpts, customOpts)
