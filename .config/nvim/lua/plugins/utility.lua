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
	{
		"mg979/vim-visual-multi",
		keys = {
			{ "<c-n>", mode = "n", desc = "Visual multi" },
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
	},
	-- {
	-- 	"laytan/tailwind-sorter.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
	-- 	build = "cd formatter && npm ci && npm run build",
	-- 	ft = { "html", "javascriptreact", "typescriptreact", "tsx", "jsx", "astro" },
	-- 	opts = {
	-- 		on_save_enabled = true,
	-- 	},
	-- },
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = { "html", "javascriptreact", "typescriptreact", "tsx", "jsx", "astro" },
		opts = {}, -- your configuration
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false, -- Recommended
		ft = "markdown", -- If you decide to lazy-load anyway

		dependencies = {
			-- You will not need this if you installed the
			-- parsers manually
			-- Or if the parsers are in your $RUNTIMEPATH
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
