-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors
local M = {}

local setHlStyles = require("utils").setHlStyles

local styles = {
	enable = {
		italic = false,
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
	-- used for CmpDoc if tranparency is disabled
	CmpDoc = {
		link = "",
	},
}

---@type HLTable
M.add = {
	-- for CmpDoc hl if tranparency is enabled
	CmpDocTransparent = { link = "none" },
	DiagnosticUnderlineError = { undercurl = true, sp = "red" },
	DiagnosticUnderlineWarn = { undercurl = true, sp = "yellow" },
	DiagnosticUnderlineInfo = { undercurl = true, sp = "blue" },
	DiagnosticUnderlineHint = { undercurl = true, sp = "purple" },
	NvimTreeOpenedFolderName = { fg = "green", bold = true },
	SagaBorder = { link = "CmpDocBorder" },
}

M.override = setHlStyles(styles, M.override)

return M
