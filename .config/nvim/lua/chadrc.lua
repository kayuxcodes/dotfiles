local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")

M.ui = {
	theme = "solarized_osaka",
	theme_toggle = { "solarized_osaka", "palenight" },
	changed_themes = highlights.changed_themes,
	transparency = false,
	hl_override = highlights.override,
	hl_add = highlights.add,

	lsp = {
		semantic_tokens = true,
		signature = true,
	},

	statusline = {
		separator_style = "default",
		theme = "default", -- default/vscode/vscode_colored/minimal
	},

	tabufline = {
		enabled = true,
		lazyload = true,
		order = { "treeOffset", "buffers", "tabs", "btns" },
		modules = nil,
	},

	cmp = {
		style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
		-- lspkind_text = false,
	},

	telescope = {
		style = "bordered",
	},

	nvdash = {
		load_on_startup = true,
		header = {
			"██╗  ██╗ █████╗ ██╗   ██╗██╗   ██╗██╗  ██╗██╗  ██╗",
			"██║ ██╔╝██╔══██╗╚██╗ ██╔╝██║   ██║╚██╗██╔╝╚██╗██╔╝",
			"█████╔╝ ███████║ ╚████╔╝ ██║   ██║ ╚███╔╝  ╚███╔╝ ",
			"██╔═██╗ ██╔══██║  ╚██╔╝  ██║   ██║ ██╔██╗  ██╔██╗ ",
			"██║  ██╗██║  ██║   ██║   ╚██████╔╝██╔╝ ██╗██╔╝ ██╗",
			"╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝",
		},
		buttons = {
			{ "  Find File", "f + f", "Telescope find_files" },
			{ "  Browse Files", "f + l", "Oil" },
			{ "󰈚  Recent Files", "f + o", "Telescope oldfiles" },
			-- { "󰈭  Find Word", "f + w", "Telescope live_grep" },
			{ "  Bookmarks", "m + a", "Telescope marks" },
			{ "  Themes", "Spc + th", "Telescope themes" },
			{ "  Mappings", "Spc + ch", "NvCheatsheet" },
		},
	},
}

M.base46 = {
	integrations = {
		"blankline",
		"cmp",
		"defaults",
		"devicons",
		"git",
		"lsp",
		"mason",
		"nvcheatsheet",
		"nvdash",
		"nvimtree",
		"statusline",
		"syntax",
		"treesitter",
		"tbline",
		"telescope",
		"whichkey",
		-- custom integrations
		"lspsaga",
		"notify",
	},
}

return M
