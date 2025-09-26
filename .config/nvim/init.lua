vim.cmd [[packadd packer.nvim]]

-- RECOMMENDED for nvim-tree (disable netrw)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- colors
vim.opt.termguicolors = true

-- require("theprimeagen.packer")
require("theprimeagen")
require("theprimeagen.packer")

-- no cursorline highlight
vim.opt.cursorline = false

