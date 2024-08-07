local lspconfig = require("lspconfig")
local config = require("nvchad.configs.lspconfig")
local user_config = require("nvconfig").lsp

local on_attach = function(client, bufnr)
	-- setup signature popup
	if user_config.signature and client.server_capabilities.signatureHelpProvider then
		require("nvchad.lsp.signature").setup(client, bufnr)
	end
end

local capabilities = config.capabilities
local on_init = config.on_init

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "tailwindcss", "astro", "powershell_es", "pyright" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		on_init = on_init,
	})
end

vim.diagnostic.config({
	virtual_text = { spacing = 4, prefix = "" },
	update_in_insert = true,
	underline = true,
	severity_sort = true,
})
