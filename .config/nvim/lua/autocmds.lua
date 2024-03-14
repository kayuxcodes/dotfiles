local autocmd = vim.api.nvim_create_autocmd

-- add your's here

autocmd("FileType", {
	pattern = { "oil", "oil_preview" },
	callback = function()
		vim.o.statuscolumn = ""
	end,
})
