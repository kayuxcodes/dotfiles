local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")

M.base46 = {
	theme = "gruvchad",
	theme_toggle = { "rosepine", "palenight" },
	changed_themes = highlights.changed_themes,
	transparency = false,
	hl_override = highlights.override,
	hl_add = highlights.add,
}

M.ui = {
	statusline = {
		separator_style = "default",
		theme = "default",
	},

	tabufline = {
		enabled = true,
		lazyload = true,
		modules = {
			-- You can add your custom component
			btns = function()
				return ""
			end,
		},
	},

	cmp = {
		style = "atom",
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
			-- "██╔═██╗ ██╔══██║  ╚██╔╝  ██║   ██║ ██╔██╗  ██╔██╗ ",
			"██║  ██╗██║  ██║   ██║   ╚██████╔╝██╔╝ ██╗██╔╝ ██╗",
			"╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝",
		},
		buttons = {
			{ "  Find File", "f + f", "Telescope find_files" },
			{ "  Browse Files", "f + l", "Oil" },
			{ "󰈚  Recent Files", "f + o", "Telescope oldfiles" },
			{ "󰈭  Find Word", "f + w", "Telescope live_grep" },
			{ "  Themes", "Spc + th", "Telescope themes" },
			-- { "  Mappings", "Spc + ch", "NvCheatsheet" },
		},
	},
}

M.lsp = {
	semantic_tokens = false, -- should be true but nvchad dosen't really support it in base46
	signature = true,
}

M.mason = {
	cmd = true,
}

return M
