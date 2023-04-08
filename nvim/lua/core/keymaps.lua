local map = vim.keymap.set
vim.g.mapleader = " "
map("i", "jk", "<ESC>") -- change Esc key for normal mode 
vim.cmd('nnoremap fn o<Esc>0"_D') -- insert newline without entering inster mode

map("n", "<leader>cc", ":nohl<CR>") -- remove highliting after searching etc..

map("n", "x", '"_x')

map("n", "<leader>+", "<C-a>") -- increase number 
map("n", "<leader>-", "<C-a>") -- decrease number            


-- window management
map("n", "<leader>sv", "<C-w>v") -- split window vertically
map("n", "<leader>sh", "<C-w>s") -- split window horizontally
map("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
map("n", "<leader>sx", ":close<CR>") -- close current split window


map("n", "<leader>to", ":tabnew<CR>") -- open new tab
map("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map("n", "<leader>tn", ":tabn<CR>") --  go to next tab
map("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- telescope
map('n', "ff", "<cmd>Telescope find_files<cr>")
map('n', 'fg', '<cmd>Telescope live_grep<cr>')
map('n', 'fs', '<cmd>Telescope grep_string')
