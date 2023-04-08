local status, packer = pcall(require, "packer") if (not status) then 
  print('packer is not installed')
  return
end

return packer.startup(function(use)
  -- packer its self
  use "wbthomason/packer.nvim"

  -- tmux & split to foucs and navigate between them    
  use "christoomey/vim-tmux-navigator"
  use "tpope/vim-surround" -- surround a word by charachter ("',) etc..  
  use "numToStr/Comment.nvim"  -- handle commment
  use "nvim-lua/plenary.nvim" -- a lua common utilities
  -- themes  
  use "cocopon/iceberg.vim" -- iceberg dark blue theme
  use "lunarvim/horizon.nvim"  -- horizon theme
  use "morhetz/gruvbox"
  use "folke/tokyonight.nvim" -- tokyonight theme
  ---
  --
  use "nvim-telescope/telescope.nvim" -- fuzzy finder
  use "nvim-telescope/telescope-file-browser.nvim"
  use { "xiyaowong/transparent.nvim", run = ":TransparentEnable" }  -- transparent background
  use "nvim-lualine/lualine.nvim"
  use { "nvim-treesitter/nvim-treesitter" }
  -- use 'p00f/nvim-ts-rainbow' -- rainbow for brackets etc..
  use 'windwp/nvim-autopairs' -- auto close parentecies 
  use 'windwp/nvim-ts-autotag'  -- auto close tags
  use 'nvim-tree/nvim-web-devicons' -- icons 
  use "akinsho/bufferline.nvim" -- organize tabs
  use 'lewis6991/gitsigns.nvim' -- git sings(M,U, etc..)

  use {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }

  -- use "kkharji/lspsaga.nvim" -- old lsp saga

  use "glepnir/lspsaga.nvim" -- lsp improved
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- formatter
  -- completion plugins
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-path' -- source for auto-complete paths
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'saadparwaiz1/cmp_luasnip' -- suuport luasnip for auto-complete
  use "rafamadriz/friendly-snippets" -- suuport many snippets in many langs

  if packer_bootstrap then 
    require("packer").sync()
  end
end)

