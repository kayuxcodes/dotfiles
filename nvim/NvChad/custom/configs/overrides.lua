local M = {}

-- local K = {}

M.treesitter = {
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "lua",
    "astro",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "python",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettierd",
    "python",
  },
}

-- telescope
M.telescope = {
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    current_buffer_fuzzy_find = {
      previewer = false,
    },
  },
  extensions_list = { "themes", "terms", "fzf" },
}
--lspsaga
M.lspsaga = {
  ui = {
    border = "double",
    -- winblend = 10,
    code_action = "",
    actionfix = " ",
  },
  hover = {
    max_width = 0.6,
    max_height = 0.6,
  },
}

-- cmp
M.cmp = function()
  local options = { window = { documentation = {} } }
  if require("core.utils").load_config().ui.transparency then
    options.window.documentation.border = "single"
    options.window.documentation.winhighlight = "Normal:CmpDocTransparent,FloatBorder:CmpDocBorder"
  end
  return options
end

-- Nvterm
M.nvterm = {
  terminals = {
    shell = "cmd",
  },
}
-- nvim-ts-autotag
M.autotag = {
  opts = {
    enable_close_on_slash = false,
    -- filetypes = {
    --   'astro'
    -- }
  },
  filetypes = { "typescriptreact", "tsx", "jsx", "astro" },
}
-- git support in nvimtree
-- M.nvimtree = {
--   git = {
--     enable = true,
--   },
--
--   renderer = {
--     highlight_git = true,
--     icons = {
--       show = {
--         git = true,
--       },
--     },
--   },
-- }

return M
