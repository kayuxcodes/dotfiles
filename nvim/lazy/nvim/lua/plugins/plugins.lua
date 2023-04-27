return {
  -- tmux & split to foucs and navigate between them    
  {"christoomey/vim-tmux-navigator", lazy = false},
  {"tpope/vim-surround", lazy = false}, -- surround a word by charachter ("',) etc..  
  {"numToStr/Comment.nvim", lazy = true},  -- handle commment
  {"nvim-lua/plenary.nvim", lazy = true}, -- a lua common utilities
  -- themes  
  { "catppuccin/nvim", lazy = true, name = "catppuccin" },
  { "cocopon/iceberg.vim", lazy = true }, -- iceberg dark blue theme
  --  "lunarvim/horizon.nvim"  -- horizon theme
  --  "morhetz/gruvbox"
  --  "folke/tokyonight.nvim" -- tokyonight theme
  {"olivercederborg/poimandres.nvim", lazy = true},
  {"sixels/caerula.nvim", lazy = true},
  -- {"Everblush/nvim", lazy = true},
  {"shaunsingh/nord.nvim", lazy = true},
  ---
  --
  {"nvim-telescope/telescope.nvim", lazy = true}, -- fuzzy finder
  {"nvim-telescope/telescope-file-browser.nvim", lazy = true},
  {"xiyaowong/transparent.nvim", build = ":TransparentEnable", lazy = false },  -- transparent background
  {"nvim-lualine/lualine.nvim", lazy = true},
  { "nvim-treesitter/nvim-treesitter" , lazy = true},
  --  'p00f/nvim-ts-rainbow' -- rainbow for brackets etc..
  {'windwp/nvim-autopairs', lazy = true}, -- auto close parentecies 
  {'windwp/nvim-ts-autotag', lazy = true},  -- auto close tags
  {'nvim-tree/nvim-web-devicons', lazy = true}, -- icons 
  {"akinsho/bufferline.nvim", lazy = true}, -- organize tabs
  {'lewis6991/gitsigns.nvim', lazy = true}, -- git sings(M,U, etc..)

  {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },

  --  "kkharji/lspsaga.nvim" -- old lsp saga

  {"glepnir/lspsaga.nvim", lazy = true}, -- lsp improved
  {'jose-elias-alvarez/null-ls.nvim', lazy = true}, -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  {'MunifTanjim/prettier.nvim', lazy = true}, -- formatter
  -- completion plugins
  {'onsails/lspkind-nvim', lazy = true}, -- vscode-like pictograms
  {'hrsh7th/cmp-buffer', lazy = false}, -- nvim-cmp source for buffer words
  {'hrsh7th/cmp-nvim-lsp', lazy = true}, -- nvim-cmp source for neovim's built-in LSP
  {'hrsh7th/cmp-path', lazy = true}, -- source for auto-complete paths
  {'hrsh7th/nvim-cmp', lazy = true }, -- Completion

  {'L3MON4D3/LuaSnip', lazy = false}, -- Snippet
  {'saadparwaiz1/cmp_luasnip', lazy = false}, -- suuport luasnip for auto-complete
  {"rafamadriz/friendly-snippets", lazy = false}, -- suuport many snippets in many langs

}

