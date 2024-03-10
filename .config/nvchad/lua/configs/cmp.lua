local M = {}

M.setup = function()
	local options = { window = { documentation = {} } }
	-- if require("nvconfig").ui.transparency then
		options.window.documentation.border = "single"
		options.window.documentation.winhighlight = "Normal:CmpDocTransparent,FloatBorder:CmpDocBorder"
	-- end
	return options
end

return M
