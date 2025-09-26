-- lsp-zero v1.x recipe
local lsp = require("lsp-zero")
lsp.preset("recommended")

local ok_mason, mason = pcall(require, "mason")
if ok_mason then mason.setup() end

local ok_mlsp, mlsp = pcall(require, "mason-lspconfig")
if ok_mlsp then
	mlsp.setup({
		ensure_installed = { "lua_ls", "tsserver", "pyright", "bashls" },
	automatic_installation = true,
})
end


-- Mason & LSPs
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pyright", "bashls" },
	automatic_installation = true,
})

-- cmp (completion)
local cmp = require("cmp")
lsp.setup_nvim_cmp({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["C-k>"] = cmp.mapping.select_prev_item(),
	},
})

-- Useful LSP keys
lsp.on_attach(function(_, bufnr)
	local k = function(lhs, rhs) 
		vim.keymap.set("n", lhs, rhs, {buffer = bufnr})
	end
	k("gd", vim.lsp.buf.definition)
	k("K", vim.lsp.buf.hover)
	k("<leader>rn", vim.lsp.buf.rename)
	k("<leader>ca", vim.lsp.buf.code_action)
	k("gr", vim.lsp.buf.references)
	k("[d", vim.diagnostic.goto_prev)
	k("]d", vim.diagnostic.goto_next)
end)

lsp.setup()
