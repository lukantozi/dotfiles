-- 1) make sure packer itself is on 'runtimepath'
vim.cmd [[packadd packer.nvim]]

-- 2) load the plugin list
require("theprimeagen.packer")
require("theprimeagen.lsp")
require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.treesitter")
--require("sessionizer")
