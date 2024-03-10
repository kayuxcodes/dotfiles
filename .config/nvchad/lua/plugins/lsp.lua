return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- format
		{
			"stevearc/conform.nvim",
			config = function()
				require("configs.conform")
			end,
		},
		-- linting
		{
			"mfussenegger/nvim-lint",
			config = function()
				require("configs.nvim-lint")
			end,
		},
		-- manage lsp servers
		{
			"williamboman/mason.nvim",
			opts = require("configs.mason").mason,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			opts = require("configs.mason").mason_lsp_config,
		},
	},
	config = function()
		require("configs.lsp-config")
	end,
}
