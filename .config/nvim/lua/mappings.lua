require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
local disableKeymap = require("util").disableKeymap

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fn", function()
	vim.cmd('normal! o<Esc>0"_D')
end, { desc = "Utils insert new line without exit normal mode" })

map("n", "<leader>cc", function()
	vim.cmd("noh")
end, { desc = "Utils delete highlighting" })

map("n", "+", function()
	vim.cmd("<C-a>")
end, { desc = "Utils increase number" })

map("n", "_", function()
	vim.cmd("<C-x>")
end, { desc = "Utils decrease number" })

map("n", "<leader>to", function()
	vim.cmd("enew")
end, { desc = "Utils New buffer" })

map("n", "<leader>tc", function()
	require("base46").toggle_theme()
end, { desc = "NvChad Toggle Theme" })

map("n", "<leader>tx", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "NvChad Close buffer" })

map("n", "<leader>tt", function()
	require("base46").toggle_transparency()
end, { desc = "NvChad Toggle transparency" })

map("n", "fl", function()
	require("oil").open()
end, { desc = "Oil Open parent directory" })

map("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "LspSaga Go to next diagnostic" })

map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "LspSaga Show in line diagnostic" })

map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "LspSaga Hover to display doc" })

map("n", "gd", "<cmd>Lspsaga finder<cr>", { desc = "LspSaga find similar defenitions" })

map("n", "ra", "<cmd>Lspsaga rename<cr>", { desc = "LspSaga Rename variables, functions, etc" })

map("n", "ga", "<cmd>Lspsaga goto_definition<cr>", { desc = "LspSaga Go to defenition" })

map("n", "gk", "<cmd>Lspsaga peek_definition<cr>", { desc = "LspSaga peek defenition" })

map("n", "gx", function()
	require("lspsaga.codeaction"):code_action()
end, { desc = "LspSaga Open code actions" })

map("i", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Lsp Display help signature" })

map("n", "ff", "<cmd>Telescope find_files <CR>", { desc = "Telescope Find files" })

map("n", "fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Telescope Find all" })

map("n", "fw", "<cmd>Telescope live_grep <CR>", { desc = "Telescope Live grep" })

map("n", "fb", "<cmd>Telescope buffers <CR>", { desc = "Telescope Find buffers" })

map("n", "fh", "<cmd>Telescope help_tags <CR>", { desc = "Telescope Help page" })

map("n", "fo", "<cmd>Telescope oldfiles <CR>", { desc = "Telescope Find oldfiles" })

map("n", "fz", "<cmd>Telescope current_buffer_fuzzy_find <CR>", { desc = "Telescope Find in current buffer" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "Conform Format file" })

map("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Lint lint file" })

map("n", "<leader>sh", "<cmd>Telescope notify<cr>", { desc = "Telescope notify" })

disableKeymap("<leader>ff")
disableKeymap("<leader>fa")
disableKeymap("<leader>fw")
disableKeymap("<leader>fb")
disableKeymap("<leader>fh")
disableKeymap("<leader>fo")
disableKeymap("<leader>fz")
disableKeymap("<C-n>")
disableKeymap("<leader>e>")
disableKeymap("<leader>b>")
disableKeymap("<leader>x>")
