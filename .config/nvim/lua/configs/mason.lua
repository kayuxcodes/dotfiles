return {
	mason = {
		ensure_installed = {
			-- lua stuff
			"lua-language-server",
			"stylua",
			-- web dev stuff
			"css-lsp",
			"html-lsp",
			"typescript-language-server",
			"deno",
			"prettierd",
			"eslint_d",
      -- md
      "alex"
		},
	},
	mason_lsp_config = {
		ensure_installed = { "tailwindcss", "astro", "powershell_es" },
	},
}
