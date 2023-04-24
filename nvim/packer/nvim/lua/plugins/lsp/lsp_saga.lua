local status, lspsaga = pcall(require, "lspsaga")
if (not status) then return end

lspsaga.setup {
 ui = {
    -- winblend = 10,
    border = 'rounded',
    colors = {
      -- normal_bg = '#002b36'
    }
  }
}

--- In lsp attach function
local map = vim.keymap.set
local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }

map('n', 'gn', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
map('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
map('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
map('n', 'gd', '<cmd>Lspsaga lsp_finder<cr>', opts)
-- map('i', '<C-k>', '<cmd>Lspsaga signature_help<cr>', opts)
map('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
map('n', 'gp', '<cmd>Lspsaga peek_definition<cr>', opts)
map('n', 'gr', '<cmd>Lspsaga rename<cr>', opts)
map('n', "ga", '<cmd>Lspsaga goto_definition<cr>', opts)

-- code action
local codeaction = require("lspsaga.codeaction")
map("n", "gx", function() codeaction:code_action() end, { silent = true })
map("v", "gx", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  codeaction:range_code_action()
end, { silent = true })
