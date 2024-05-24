local plugins = {
	"lukas-reineke/indent-blankline.nvim",
	"nvim-tree/nvim-tree.lua",
	"NvChad/nvim-colorizer.lua",
	"numToStr/Comment.nvim",
}

local disabledPlugins = {}

for key, value in ipairs(plugins) do
	disabledPlugins[key] = { value, enabled = false }
end

return disabledPlugins
