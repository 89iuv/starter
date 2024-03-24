-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = require("configs.lsp").lspconfig.servers

-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp == "clangd" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
      cmd = {
        "clangd",
        -- https://clangd.llvm.org/extensions#utf-8-offsets
        "--offset-encoding=utf-16",
      },
    }
    goto continue
  end

  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init, capabilities = capabilities,
  }

  ::continue::
end
