-- plugins must exist; these requires will error if missing (OK)
local lspconfig   = require("lspconfig")
local mason       = require("mason")
local mason_lsp   = require("mason-lspconfig")

-- ===== completion (cmp + luasnip) =====
local cmp     = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = false }),
        ["<Tab>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
        end, { "i","s" }),
        ["<S-Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            else fallback() end
        end, { "i","s" }),
    }),
    sources = {
        { name = "nvim_lsp" }, { name = "luasnip" }, { name = "path" }, { name = "buffer" },
    },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ===== buffer-local LSP maps =====
local function on_attach(_, bufnr)
    local o = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "gd",         function() vim.lsp.buf.definition() end, o)
    vim.keymap.set("n", "gD",         function() vim.lsp.buf.declaration() end, o)
    vim.keymap.set("n", "gi",         function() vim.lsp.buf.implementation() end, o)
    vim.keymap.set("n", "go",         function() vim.lsp.buf.type_definition() end, o)
    vim.keymap.set("n", "gr",         function() vim.lsp.buf.references() end, o)
    vim.keymap.set("n", "K",          function() vim.lsp.buf.hover() end, o)
    vim.keymap.set("n", "<C-k>",      function() vim.lsp.buf.signature_help() end, o)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, o)
    vim.keymap.set({ "n","v" }, "<leader>ca", function() vim.lsp.buf.code_action() end, o)
    vim.keymap.set("n", "]d",         function() vim.diagnostic.goto_next() end, o)
    vim.keymap.set("n", "[d",         function() vim.diagnostic.goto_prev() end, o)
    vim.keymap.set("n", "<leader>e",  function() vim.diagnostic.open_float() end, o)
    vim.keymap.set("n", "<leader>f",  function() vim.lsp.buf.format({ async = true }) end, o)
end

-- optional: kill semantic tokens if they mess with colors
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local c = vim.lsp.get_client_by_id(args.data.client_id)
        if c and c.server_capabilities then c.server_capabilities.semanticTokensProvider = nil end
    end,
})

-- ===== Mason install + server setups =====
mason.setup({})
mason_lsp.setup({
    ensure_installed = { "lua_ls", "pyright" },
    automatic_installation = true,
})

-- Lua
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace   = { checkThirdParty = false },
            telemetry   = { enable = false },
        }
    },
})

-- Python
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

