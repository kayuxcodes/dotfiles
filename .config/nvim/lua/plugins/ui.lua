return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = require("configs.noice"),
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			{
				"rcarriga/nvim-notify",
				opts = require("configs.notify"),
			},
		},
	},
	{
		"nvchad/base46",
		lazy = false,
		config = function()
			vim.cmd("hi clear")
			-- vim.cmd("qa!")
		end,
	},
	{
		"rose-pine/neovim",
		enabled = false,
		-- enabled = require("nvconfig").ui.theme == "rosepine",
		-- lazy = false,
		-- priority = 1000,
	},

	{
		"folke/tokyonight.nvim",
		enabled = false,
		-- enabled = require("nvconfig").ui.theme == "tokyonight",
		-- lazy = false,
		-- priority = 1000,
	},
}
