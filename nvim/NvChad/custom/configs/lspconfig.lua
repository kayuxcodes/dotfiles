local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local mason_lsp = require "mason-lspconfig"

mason_lsp.setup {
  ensure_installed = { "tailwindcss" },
}
-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
