-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/styx/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?.lua;/home/styx/.cache/nvim/packer_hererocks/2.1.1753364724/share/lua/5.1/?/init.lua;/home/styx/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?.lua;/home/styx/.cache/nvim/packer_hererocks/2.1.1753364724/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/styx/.cache/nvim/packer_hererocks/2.1.1753364724/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n±\4\0\0\t\0\28\00146\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\6\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\24\2'\3\25\0=\3\5\0029\2\26\0009\4\27\1B\2\2\1K\0\1\0\vconfig\nsetup\28Have a focused session.\vfooter\f:qa<CR>\14ï€‘  Quit\6q#:e ~/.config/nvim/init.lua<CR>\16î˜•  Config\6c\24:NvimTreeToggle<CR>\19î—¿  File tree\6e\28:Telescope oldfiles<CR>\16ï‡š  Recent\6r\30:Telescope find_files<CR>\19ï€‚  Find file\6f\vbutton\fbuttons\1\3\0\0\19   ï¯  Neovim\27     do one thing well\bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\v€€À™\4\0" },
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cloak.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/cloak.nvim",
    url = "https://github.com/laytan/cloak.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n™\5\0\0\a\0\26\0+6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\16€9\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0005\6\b\0=\6\t\5=\5\n\0045\5\f\0005\6\v\0=\6\r\0055\6\14\0=\6\15\5=\5\16\4B\2\2\1X\2\6€6\2\1\0'\4\17\0B\2\2\0029\2\3\0025\4\18\0B\2\2\0016\2\19\0009\2\20\0029\2\21\2)\4\0\0'\5\22\0005\6\23\0B\2\4\0016\2\19\0009\2\20\0029\2\21\2)\4\0\0'\5\24\0005\6\25\0B\2\4\1K\0\1\0\1\0\2\14nocombine\2\afg\f#ffffff\rIblScope\1\0\2\14nocombine\2\afg\f#ffffff\14IblIndent\16nvim_set_hl\bapi\bvim\1\0\4\31show_current_context_start\1\tchar\bâ”‚\25show_current_context\2#show_trailing_blankline_indent\1\21indent_blankline\fexclude\rbuftypes\1\5\0\0\rterminal\vnofile\rquickfix\vprompt\14filetypes\1\0\2\rbuftypes\0\14filetypes\0\1\6\0\0\thelp\nalpha\14dashboard\rNvimTree\fTrouble\nscope\14highlight\1\2\0\0\rIblScope\1\0\4\fenabled\2\14highlight\0\rshow_end\1\15show_start\1\vindent\1\0\3\fexclude\0\nscope\0\vindent\0\1\0\2\rtab_char\bâ”‚\tchar\bâ”‚\nsetup\bibl\frequire\npcall\0" },
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n¦\2\0\0\4\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\1\bgit\1\0\2\vignore\1\venable\2\rrenderer\1\0\2\18highlight_git\2\16group_empty\2\tview\1\0\2\tside\tleft\nwidth\3\"\24update_focused_file\1\0\5\tview\0\bgit\0\24update_focused_file\0\rrenderer\0\ffilters\0\1\0\1\venable\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["rose-pine"] = {
    config = { "\27LJ\2\n¼\3\0\0\5\0\19\00036\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\a\0005\4\b\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\t\0005\4\n\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\v\0005\4\f\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\r\0005\4\14\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\15\0005\4\16\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\17\0005\4\18\0B\0\4\1K\0\1\0\1\0\1\abg\f#000000\20TelescopeBorder\1\0\1\abg\f#000000\20TelescopeNormal\1\0\1\abg\f#000000\16FloatBorder\1\0\1\abg\f#000000\16NormalFloat\1\0\1\abg\f#000000\rNormalNC\1\0\1\abg\f#000000\vNormal\16nvim_set_hl\bapi\26colorscheme rose-pine\bcmd!rose_pine_disable_background\6g\bvim\0" },
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-apm"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/vim-apm",
    url = "https://github.com/ThePrimeagen/vim-apm"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/vim-be-good",
    url = "https://github.com/ThePrimeagen/vim-be-good"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/styx/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\2\n¼\3\0\0\5\0\19\00036\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\a\0005\4\b\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\t\0005\4\n\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\v\0005\4\f\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\r\0005\4\14\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\15\0005\4\16\0B\0\4\0016\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\17\0005\4\18\0B\0\4\1K\0\1\0\1\0\1\abg\f#000000\20TelescopeBorder\1\0\1\abg\f#000000\20TelescopeNormal\1\0\1\abg\f#000000\16FloatBorder\1\0\1\abg\f#000000\16NormalFloat\1\0\1\abg\f#000000\rNormalNC\1\0\1\abg\f#000000\vNormal\16nvim_set_hl\bapi\26colorscheme rose-pine\bcmd!rose_pine_disable_background\6g\bvim\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n™\5\0\0\a\0\26\0+6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\16€9\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0005\6\b\0=\6\t\5=\5\n\0045\5\f\0005\6\v\0=\6\r\0055\6\14\0=\6\15\5=\5\16\4B\2\2\1X\2\6€6\2\1\0'\4\17\0B\2\2\0029\2\3\0025\4\18\0B\2\2\0016\2\19\0009\2\20\0029\2\21\2)\4\0\0'\5\22\0005\6\23\0B\2\4\0016\2\19\0009\2\20\0029\2\21\2)\4\0\0'\5\24\0005\6\25\0B\2\4\1K\0\1\0\1\0\2\14nocombine\2\afg\f#ffffff\rIblScope\1\0\2\14nocombine\2\afg\f#ffffff\14IblIndent\16nvim_set_hl\bapi\bvim\1\0\4\31show_current_context_start\1\tchar\bâ”‚\25show_current_context\2#show_trailing_blankline_indent\1\21indent_blankline\fexclude\rbuftypes\1\5\0\0\rterminal\vnofile\rquickfix\vprompt\14filetypes\1\0\2\rbuftypes\0\14filetypes\0\1\6\0\0\thelp\nalpha\14dashboard\rNvimTree\fTrouble\nscope\14highlight\1\2\0\0\rIblScope\1\0\4\fenabled\2\14highlight\0\rshow_end\1\15show_start\1\vindent\1\0\3\fexclude\0\nscope\0\vindent\0\1\0\2\rtab_char\bâ”‚\tchar\bâ”‚\nsetup\bibl\frequire\npcall\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n¦\2\0\0\4\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\1\bgit\1\0\2\vignore\1\venable\2\rrenderer\1\0\2\18highlight_git\2\16group_empty\2\tview\1\0\2\tside\tleft\nwidth\3\"\24update_focused_file\1\0\5\tview\0\bgit\0\24update_focused_file\0\rrenderer\0\ffilters\0\1\0\1\venable\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n±\4\0\0\t\0\28\00146\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\6\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\2>\4\2\0039\4\b\1'\6\15\0'\a\16\0'\b\17\0B\4\4\2>\4\3\0039\4\b\1'\6\18\0'\a\19\0'\b\20\0B\4\4\2>\4\4\0039\4\b\1'\6\21\0'\a\22\0'\b\23\0B\4\4\0?\4\0\0=\3\5\0029\2\3\0019\2\24\2'\3\25\0=\3\5\0029\2\26\0009\4\27\1B\2\2\1K\0\1\0\vconfig\nsetup\28Have a focused session.\vfooter\f:qa<CR>\14ï€‘  Quit\6q#:e ~/.config/nvim/init.lua<CR>\16î˜•  Config\6c\24:NvimTreeToggle<CR>\19î—¿  File tree\6e\28:Telescope oldfiles<CR>\16ï‡š  Recent\6r\30:Telescope find_files<CR>\19ï€‚  Find file\6f\vbutton\fbuttons\1\3\0\0\19   ï¯  Neovim\27     do one thing well\bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\v€€À™\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
