vim.g.netrw_banner = 0
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block-blinkwait300-blinkon200-blinkoff150,r-cr:hor20"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ttimeoutlen = 10

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.o.winborder = "rounded"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.statusline = "%f %m %r %=%-14.(%l,%c%) %P"
--vim.opt.colorcolumn = 100

vim.g.clipboard = {
    name = "xclip",
    copy = {
        ["+"] = "xclip -selection clipboard -in",
        ["*"] = "xclip -selection primary -in",
    },
    paste = {
        ["+"] = "xclip -selection clipboard -out",
        ["*"] = "xclip -selection primary -out",
    },
    cache_enabled = 0,
}

vim.g.mapleader = " "

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.hl.on_yank { higroup = 'IncSearch', timeout = 50}
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("restore_cursor", {}),
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then return end
		local last_pos = vim.api.nvim_buf_get_mark(0, '"')
		local last_line = vim.api.nvim_buf_line_count(0)
		local row = last_pos[1]
		if row < 1 or row > last_line then return end
		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

--=================================
--=============remap==============
local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map('n', '<leader>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<leader>l', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("x", "<leader>p", [["_dP]])

map("n", "<leader>u", vim.cmd.UndotreeToggle)
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

local diag_visible = false   -- off by default on startup
vim.diagnostic.enable(false)

vim.diagnostic.config({
--    virtual_text     = false,
    signs            = false,
    underline        = false,
    update_in_insert = false,
    float = {
        border  = "rounded",
        source  = true,
    },
})

-- populate quickfix
map("n", "<leader>dq", function()
    vim.diagnostic.setqflist()
    vim.cmd("copen")
end, { desc = "Diagnostics → quickfix" })

-- open/close
map("n", "<leader>q", function()
    local qf_open = #vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix") > 0
    if qf_open then vim.cmd("cclose") else vim.cmd("copen") end
end, { desc = "Toggle quickfix" })

-- navigate entries
map("n", "]q", "<cmd>cnext<CR>",     { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<CR>",     { desc = "Prev quickfix" })
map("n", "]Q", "<cmd>clast<CR>",     { desc = "Last quickfix" })
map("n", "[Q", "<cmd>cfirst<CR>",    { desc = "First quickfix" })

-- Diagnostics
-- float diagnostics
map("n", "<leader>e", function()
    vim.diagnostic.open_float()
end, { desc = "Show diagnostic float" })

-- enable/disable diagnostics
--map("n", "<leader>td", function()
--    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
--end, { desc = "Toggle diagnostics" })

map("n", "<leader>td", function()
    diag_visible = not diag_visible
    vim.diagnostic.config({
--        virtual_text = diag_visible,
        signs        = diag_visible,
        underline    = diag_visible,
    })
    vim.notify(
        "Diagnostics " .. (diag_visible and "enabled" or "disabled"),
        vim.log.levels.INFO
    )
end, { desc = "Toggle diagnostics display" })

-- show file path
map("n", "<leader>pa", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("file:", path)
end, { desc = "Copy full file path" })

-- install lazy.nvim package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- wannabe tsoding
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            italic = {
                comments = false,
                strings = false,
                folds = false,
            },
        },
    },

    { "Vimjas/vim-python-pep8-indent" },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "python", "lua", "c", "cpp", "bash" },
            highlight = { enable = true },
            indent = { enable = true },
    },
},

    -- undo
    { "mbbill/undotree" },

    -- autopair; may disable later
    {
        "windwp/nvim-autopairs",
        config = true
    },

    -- puml
    { "Maduki-tech/nvim-plantuml" },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "master",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>pf", builtin.find_files,  { desc = "Find files" })
            vim.keymap.set("n", "<C-p>",      builtin.git_files,   { desc = "Git files" })
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end, { desc = "Grep string" })

            -- List all functions/classes/vars in the current file
            vim.keymap.set("n", "<leader>po", builtin.lsp_document_symbols,  { desc = "Document symbols" })

            -- Search symbol names across the whole project (needs active LSP)
            vim.keymap.set("n", "<leader>pw", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
        end,
    },
    -- completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                completion = {
                    autocomplete = false,
                },
                performance = {
                    max_view_entries = 12,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-y>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        else
                            cmp.complete()
                            vim.defer_fn(function()
                                if cmp.visible() then
                                    cmp.confirm({ select = true })
                                end
                            end, 50)
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                },
            })
        end,
    },
    -- LSP stack
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "clangd" },
            })
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-t>",     function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>",     function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>",     function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>",     function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>",     function() harpoon:list():select(4) end)

            -- Toggle previous & next buffers stored within Harpoon list
            -- vim.keymap.set("n", "<C-S-J>", function() harpoon:list():prev() end)
            -- vim.keymap.set("n", "<C-S-K>", function() harpoon:list():next() end)
    end,
    },
    {
        'Vonr/align.nvim',
        branch = "v2",
        lazy = false,
        init = function()
            local NS = { noremap = true, silent = true }

            -- Aligns to 1 character
            vim.keymap.set('x', 'aa', function() require'align'.align_to_char({ length = 1, }) end, NS)

            -- Aligns to 2 characters with previews
            vim.keymap.set('x', 'ad', function() require'align'.align_to_char({ preview = true, length = 2, }) end, NS)

            -- Aligns to a string with previews
            vim.keymap.set('x', 'aw', function() require'align'.align_to_string({ preview = true, regex = false, }) end, NS)

            -- Aligns to a Vim regex with previews
            vim.keymap.set('x', 'ar', function() require'align'.align_to_string({ preview = true, regex = true, }) end, NS)
        end
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Tell LSP servers about the extra completion capabilities
            -- that nvim-cmp adds (otherwise they give fewer suggestions)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    -- Disable semantic tokens: prevents LSP from overriding
                    -- your colorscheme's syntax colors with its own
                    client.server_capabilities.semanticTokensProvider = nil

                    local o = { buffer = args.buf, silent = true }
                    vim.keymap.set("n", "gd",           vim.lsp.buf.definition,    o)
                    vim.keymap.set("n", "gD",           vim.lsp.buf.declaration,   o)
                    vim.keymap.set("n", "gi",           vim.lsp.buf.implementation,o)
                    vim.keymap.set("n", "gr",           vim.lsp.buf.references,    o)
                    vim.keymap.set("n", "K",            vim.lsp.buf.hover,         o)
                    vim.keymap.set("n", "<leader>rn",   vim.lsp.buf.rename,        o)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, o)
                    vim.keymap.set("n", "<leader>f",    function()
                        vim.lsp.buf.format({ async = true })
                    end, o)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, o)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, o)
                end,
            })

            -- lua_ls: tell it 'vim' is a valid global so no false warning
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace   = { checkThirdParty = false },
                        telemetry   = { enable = false },
                    },
                },
            })

            vim.lsp.config("pyright",  { capabilities = capabilities })
            vim.lsp.config("clangd",   { capabilities = capabilities})
            vim.lsp.config("ts_ls",    { capabilities = capabilities })
            vim.lsp.enable({ "lua_ls", "pyright", "clangd", "ts_ls"})
        end,
    },

}, {
    -- Don't auto-check for plugin updates on startup
    checker = { enabled = false },
})

vim.cmd.colorscheme("gruber-darker")
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "#555555" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underline = false })
