-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors
local M = {}

local setHlStyles = require("utils").setHlStyles

local styles = {
	enable = {
		italic = true,
		bold = true,
		reverse = true,
		strikethrough = true,
		undercurl = true,
		underline = true,
		standout = true,
	},
	hls = {
		italic = {
			"Comment",
			"@comment",
			"Identifier",
			"Function",
			"Keyword",
			"@keyword",
			"@keyword.function",
		},
		bold = {
			"DiffAdd",
			"DiffChange",
			"DiffDelete",
			"DiffText",
			"WinSeperatror",
			"Folded",
			"MatchParen",
			"NonText",
			"Question",
			"QuickFixLine",
			"Title",
			"WarningMsg",
			"Todo",
			"LspSignatureActiveParameter",
			"LazyProgressDone",
			"LazyProgressTodo",
		},
		reverse = {
			"ErrorMsg",
			-- "PmenuSel",
			"PmenuSbar",
			"PmenuThumb",
			"Search",
			"Visual",
			"VisualNOS",
		},
		undercurl = {
			"SpellBad",
			"SpellCap",
			"SpellLocal",
			"SpellRare",
			"DiagnosticUnderlineError",
			"DiagnosticUnderlineWarn",
			"DiagnosticUnderlineInfo",
			"DiagnosticUnderlineHint",
			"@lsp.type.unresolvedReference",
		},
		underline = {
			"LspReferenceText",
			"LspReferenceRead",
			"LspReferenceWrite",
			"@text.reference",
		},
		standout = {
			"IncSearch",
		},
		strikethrough = {
			"CmpItemAbbrDeprecated",
		},
	},
}

---@type Base46HLGroupsList
M.override = {
	TblineFill = {
		link = "none",
	},
	TbLineBufOn = {
		italic = true,
		bold = true,
	},
	-- this will used for CmpDoc if tranparency is disabled
	CmpDoc = {
		link = "",
	},
	NvDashAscii = {
		bg = "none",
		fg = "blue",
	},
	NvDashButtons = {
		bg = "none",
	},
	Comment = { italic = true },

	-- DiagnosticError = { link = "", bg = { "red", -45 } },
	-- DiagnosticHint = { link = "", bg = { "lightbg", -50 } },
	-- DiagnosticWarn = { link = "", bg = { "yellow", -75 } },
}

---@type HLTable
M.add = {
	NvimTreeOpenedFolderName = { fg = "green", bold = true },
	-- CmpDoc if tranparency is enabled
	CmpDocTransparent = { link = "none" },
	SagaBorder = { link = "CmpDocBorder" },
	DiagnosticSignHint = { fg = "lightbg" },
	DiagnosticSignWarn = { fg = "yellow" },
	DiagnosticSignError = { fg = "red" },
	NotifyBackground = { bg = "black" },
}

M.override = setHlStyles(styles, M.override)

M.changed_themes = {}

return M
