return {
	{
		"nvim-telescope/telescope.nvim",
		opts = require("configs.telescope"),
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("configs.treesitter"),
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "syntax")
			dofile(vim.g.base46_cache .. "treesitter")
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = require("configs.cmp"),
	},
	{
		"stevearc/oil.nvim",
		event = "VeryLazy",
		config = function()
			require("oil").setup()
		end,
	},
}
