local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
map("i", "jk", "<ESC>", opts) -- change Esc key for normal mode 
vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ")
vim.cmd('nnoremap fn o<Esc>0"_D') -- insert newline without entering inster mode

map("n", "<leader>cc", ":nohl<CR>", opts) -- remove highliting after searching etc..

map("n", "x", '"_x')

map("n", "<leader>+", "<C-a>", opts) -- increase number 
map("n", "<leader>-", "<C-a>", opts) -- decrease number            


-- window management
map("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
map("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
map("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
map("n", "<leader>sx", ":close<CR>", opts) -- close current split window


map("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
map("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
map("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
map("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- telescope
map('n', "ff", "<cmd>Telescope find_files<cr>", opts)
map('n', 'fg', "<cmd>Telescope live_grep<cr>", opts)
map('n', 'fs', "<cmd>Telescope grep_string", opts)
