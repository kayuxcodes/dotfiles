return {
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<C-s>"] = "actions.select_vsplit",
		["gh"] = "actions.select_split",
		["gt"] = "actions.select_tab",
		["gp"] = "actions.preview",
		["q"] = "actions.close",
		["gl"] = "actions.refresh",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	},
 float = {
    padding = 2,
    max_width = 120,
    max_height = 20,
    border = "solid",
  },
}

