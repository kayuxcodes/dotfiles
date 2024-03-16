return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascriptreact", "typescriptreact", "tsx", "jsx", "astro" },
		opts = require("configs.nvim-ts-autotag"),
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "VeryLazy",
		opts = require("configs.lspsaga"),
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
	{
		"barrett-ruth/import-cost.nvim",
		build = "sh install.sh yarn",
		ft = { "javascriptreact", "typescriptreact", "tsx" },
		config = true,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		opts = require("configs.nvim-highlight-colors"),
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
}
