require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local disableKeymap = require("utils").disableKeymap
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<leader>fn", function()
    vim.cmd('normal! o<Esc>0"_D')
end, { desc = "insert new line without exit normal mode" })

map("n", "<leader>cc", function()
    vim.cmd('noh')
end, { desc = "delete highlighting" })

map("n", "+", function()
    vim.cmd('<C-a>')
end, { desc = "increase number" })

map("n", "_", function()
    vim.cmd('<C-x>')
end, { desc = "decrease number" })

map("n", "<leader>to", function()
    vim.cmd('enew')
end, { desc = "New buffer" })

map("n", "<leader>tc", function()
    require("base46").toggle_theme()
end, { desc = "Toggle Theme" })

map("n", "<leader>tx", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

map("n", "<leader>tt", function()
    require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })

map("n", "<leader>r", function()
    local cmd = "python3 " .. vim.fn.expand("%")
    local term = require("nvterm.terminal")
    term.send(cmd, "horizontal", true)
end, { desc = "execute current python file" })

map("n", "fl", function()
    require("oil").open()
end, { desc = "Open parent directory" })

map("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Go to next diagnostic" })

map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "Show in line diagnostic" })

map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover to display doc" })

map("n", "gd", "<cmd>Lspsaga finder<cr>", { desc = "find similar defenitions" })

map("n", "ra", "<cmd>Lspsaga rename<cr>", { desc = "Rename variables, functions, etc" })

map("n", "ga", "<cmd>Lspsaga goto_definition<cr>", { desc = "Go to defenition" })

map("n", "gk", "<cmd>Lspsaga peek_definition<cr>", { desc = "peek defenition" })

map("n", "gx", function()
    require("lspsaga.codeaction"):code_action()
end, { desc = "Open code actions" })

map("i", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Display help signature" })

map("n", "ff", "<cmd>Telescope find_files <CR>", { desc = "Find files" })

map("n", "fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all" })

map("n", "fw", "<cmd>Telescope live_grep <CR>", { desc = "Live grep" })

map("n", "fb", "<cmd>Telescope buffers <CR>", { desc = "Find buffers" })

map("n", "fh", "<cmd>Telescope help_tags <CR>", { desc = "Help page" })

map("n", "fo", "<cmd>Telescope oldfiles <CR>", { desc = "Find oldfiles" })

map("n", "fz", "<cmd>Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })

map("n", "<leader>fm", function()
    require("conform").format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    }
end, { desc = "Format file" })

map("n", "<leader>l", function()
    require("lint").try_lint()
end, { desc = "lint file" })

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
