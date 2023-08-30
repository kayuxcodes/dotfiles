---@type MappingsTable
local M = {}
local opts = { nowait = true, silent = true, noremap = true }
vim.cmd("noremap <c-k> <Nop>")
M.general = {
  n = {
    ["<leader>fn"] = { 'o<Esc>0"_D', "insert new line wihtout exit normal mode", opts },
    ["<leader>cc"] = { "<cmd>noh<cr>", "delete highlighting", opts },
    ["+"] = { "<C-a>", "increase number", opts },
    ["_"] = { "<C-x>", "decerease number", opts },
    ["<leader>to"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>tc"] = {
      function()
        require("base46").toggle_theme()
      end,
      "Toggle Theme",
    },
    ["<leader>tx"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
    ["<leader>r"] = {
      function()
        local cmd = "python3 " .. vim.fn.expand "%"
        local term = require "nvterm.terminal"
        -- term.toggle "horizontal"
        term.send(cmd, "horizontal", true)
      end,
      "execute current python file",
    },
  },
}

-- more keybinds!

M.oil = {
  n = {
    ["fl"] = {
      function()
        require("oil").open()
      end,
      "Open parent directory",
      opts,
    },
  },
}
M.lspsaga = {
  n = {
    ["gn"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go to next diagnostic", opts },
    ["gl"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show in line diagnostic", opts },
    ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover to display doc", opts },
    ["gd"] = { "<cmd>Lspsaga finder<cr>", "find similar defenitions", opts },
    ["gr"] = { "<cmd>Lspsaga rename<cr>", "Rename variables, functions, etc", opts },
    ["ga"] = { "<cmd>Lspsaga goto_definition<cr>", "Go to defenition", opts },
    ["gk"] = { "<cmd>Lspsaga peek_definition<cr>", "peek defenition", opts },
    ["gx"] = {
      function()
        require("lspsaga.codeaction"):code_action()
      end,
      "Open code actions",
      opts,
    },
  },
  i = {
    ["<c-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Display help signature", opts },
  },
}

M.telescope = {
  n = {
    -- find
    ["ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
  },
}
-- kemaps disabled
M.disabled = {
  n = {
    ["<leader>ff"] = "",
    ["<leader>fa"] = "",
    ["<leader>fw"] = "",
    ["<leader>fb"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>fz"] = "",
    ["<C-n>"] = "",
    ["<leader>e"] = "",
    ["<leader>b"] = "",
    ["<leader>x"] = "",
  },
}
return M
