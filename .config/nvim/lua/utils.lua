local M = {}

-- set highlights styles, italic, bold, reverse, etc
M.setHlStyles = function(styles, override)
	local T = {}
	for style, tbl in pairs(styles.hls) do
		for _, hl in ipairs(tbl) do
			if styles.enable[style] then
				T[hl] = { [style] = true, link = "" }
			end
		end
	end
	return vim.tbl_deep_extend("force", override, T)
end

-- idk why vim.keymap.del didn't work
-- maybe its removing it before nvchad add that map
M.disableKeymap = function(lhs, mode)
	mode = mode and mode or "n"
	vim.keymap.set(mode, lhs, "", { desc = "" })
end

return M
