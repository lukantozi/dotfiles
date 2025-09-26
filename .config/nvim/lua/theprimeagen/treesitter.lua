require("nvim-treesitter.configs").setup {
	ensure_installed = { "lua", "vim", "vimdoc", "bash", "json", "typescript", "javascript", "python" },
	highlight = { enable = true },
	indent = { enable = true },
}
