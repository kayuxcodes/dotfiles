local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require("custom.configs.telescope").opts,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "typescriptreact", "tsx" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    config = function()
      local status, lspsaga = pcall(require, "custom.configs.lspsaga")
      if status then
        lspsaga.config()
      end
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
      require("oil").setup()
    end,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },

  -- disabled plugins
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
