return require("packer").startup(function(use)
	-- Packer manages itself
	use "wbthomason/packer.nvim"

	------------------
	-- Core plugins --
	------------------
	use { "nvim-lua/plenary.nvim" }
	use { "nvim-telescope/telescope.nvim", tag = "0.1.4",
		requires = { "nvim-lua/plenary.nvim" } }
	use "folke/tokyonight.nvim"
  use({ "rose-pine/neovim", as = "rose-pine",
		config = function()
      vim.g.rose_pine_disable_background = true
      vim.cmd("colorscheme rose-pine")
      -- override background
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#000000" })
    end
  })
  -- icons (needed by nvim-tree)
  use "nvim-tree/nvim-web-devicons"


  -- FILE EXPLORER
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        update_focused_file = { enable = true },
        view = { width = 34, side = "left" },
        renderer = { group_empty = true, highlight_git = true },
        git = { enable = true, ignore = false },
        filters = { dotfiles = false },
      })
    end,
  }

  -- INDENT LINES (vertical guides)
  use {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local ok, ibl = pcall(require, "ibl")
    if ok then
      ibl.setup({
        indent = { char = "│", tab_char = "│" },

        -- highlight the CURRENT indent scope, but draw only verticals
        scope = {
          enabled = true,
          show_start = false,  -- no start “└/┌” markers (no horizontal bits)
          show_end   = false,  -- no end markers
          highlight  = { "IblScope" },
        },

        exclude = {
          filetypes = { "help", "alpha", "dashboard", "NvimTree", "Trouble" },
          buftypes  = { "terminal", "nofile", "quickfix", "prompt" },
        },
      })
    else
      require("indent_blankline").setup({
        char = "│",
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = false, -- avoid horizontal marker on old API
      })
    end

    -- make base guides and “current scope” distinct on black background
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3f3f3f", nocombine = true })
    vim.api.nvim_set_hl(0, "IblScope",  { fg = "#ffffff", nocombine = true })
  end,
}

  use {
  "goolord/alpha-nvim",
  requires = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "     Neovim",
      "     do one thing well",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent",    ":Telescope oldfiles<CR>"),
      dashboard.button("e", "  File tree", ":NvimTreeToggle<CR>"),
      dashboard.button("c", "  Config",    ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "  Quit",      ":qa<CR>"),
    }

    dashboard.section.footer.val = "Have a focused session."

    alpha.setup(dashboard.config)
  end,
}

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter",
  run = function() require("nvim-treesitter.install").update({ with_sync = true }) end })
	use "nvim-treesitter/playground"

	-- Primagen favs
	use "ThePrimeagen/harpoon"
	use "ThePrimeagen/vim-apm"
	use "ThePrimeagen/vim-be-good"
	use "ThePrimeagen/refactoring.nvim"
	use "mbbill/undotree"
	use "tpope/vim-fugitive"

	--LSP Zero (quick LSP + cmp)
	use { "williamboman/mason.nvim", run = ":MasonUpdate" }
	use "williamboman/mason-lspconfig.nvim"
  use { 'neovim/nvim-lspconfig'}
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',   -- <— pin to the old API your config uses
  requires = {
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  }
}



		
-- Autocompletion
use "hrsh7th/nvim-cmp"
use "hrsh7th/cmp-buffer"
use "hrsh7th/cmp-path"
use "hrsh7th/cmp-nvim-lsp"
use "hrsh7th/cmp-nvim-lua"
	  
-- Snippets
use "L3MON4D3/LuaSnip"
use "rafamadriz/friendly-snippets"
	
-- Optional extras
-- use "ThePrimeagen/tmux-sessionizer"
  use "folke/zen-mode.nvim"
  use "github/copilot.vim"
  use "laytan/cloak.nvim"



end)
