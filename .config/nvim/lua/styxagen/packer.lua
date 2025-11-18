--   - This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


  -- lua/plugins/vesper.lua
  use {
	  'datsfilipe/vesper.nvim',
	  config = function()
		  require('vesper').setup({
			  transparent = false,
			  italics = {
				  comments   = false,
				  keywords   = false,
				  functions  = false,
				  strings    = false,
				  variables  = false,
			  },
			  overrides = {},
			  palette_overrides = {},
		  })

		  -- Apply the colorscheme *after* setup
		  vim.cmd.colorscheme('vesper')
		  vim.api.nvim_set_hl(0, "Normal",      { bg = "#000000" })
		  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
		  vim.api.nvim_set_hl(0, "SignColumn",  { bg = "#000000" })
	  end
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use "wbthomason/packer.nvim"

  -- LSP core
  use { "neovim/nvim-lspconfig", tag = "v0.1.7" }
  use { "williamboman/mason.nvim", run = ":MasonUpdate" }
  use "williamboman/mason-lspconfig.nvim"

  -- Completion + snippets (explicit, no lsp-zero)
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"


  use {
	  "windwp/nvim-autopairs",
	  config = function()
		  require("nvim-autopairs").setup {}
	  end,
  }

end) 
