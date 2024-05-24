return {
	lsp = { signature = { enabled = false }, hover = { enabled = false }, message = { enabled = false } },
	routes = {
		{
			-- avoid annoying message
			filter = {
				event = "notify",
				find = "No information available",
			},
			opts = { skip = true },
		},
	},
	presets = {
		lsp_doc_border = false,
		bottom_search = true,
		long_message_to_split = true,
	},
}
