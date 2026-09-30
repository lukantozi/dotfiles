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
-- vim.opt.colorcolumn = 100

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

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Highlight selection on yank",
    pattern = "*",
    callback = function() vim.hl.on_yank({ higroup = "IncSearch", timeout = 50, }) end,
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

-- =================================
-- ============= remap =============
local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<leader>j", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<leader>k", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("x", "<leader>p", [["_dP]])
map("n", "<leader>u", vim.cmd.UndotreeToggle)
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- =================================
-- =========== quickfix ============
map("n", "<leader>q", function()
    local qf_open = #vim.fn.filter( vim.fn.getwininfo(), "v:val.quickfix") > 0

    if qf_open then vim.cmd("cclose") else vim.cmd("copen") end
end, { desc = "Toggle quickfix", })

map("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix", })
map("n", "[q", "<cmd>cprev<CR>", { desc = "Prev quickfix", })
map("n", "]Q", "<cmd>clast<CR>", { desc = "Last quickfix", })
map("n", "[Q", "<cmd>cfirst<CR>", { desc = "First quickfix", })

-- =================================
-- ========== lazy.nvim ============
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath, })

    if vim.v.shell_error ~= 0 then error("Error cloning lazy.nvim:\n" .. out) end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        opts = { italic = { comments = false, strings = false, folds = false, }, },
    },

    { "Vimjas/vim-python-pep8-indent", },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = { ensure_installed = { "python", "lua", "c", "cpp", "bash", },
            highlight = { enable = true, },
            indent = { enable = true, },
        },
    },

    { "mbbill/undotree", },

    {
        "nvim-telescope/telescope.nvim",
        branch = "master",
        dependencies = { "nvim-lua/plenary.nvim", },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set( "n", "<leader>pf", builtin.find_files, { desc = "Find files" })
            vim.keymap.set( "n", "<C-p>", builtin.git_files, { desc = "Git files" })
            vim.keymap.set( "n", "<leader>ps", function() builtin.grep_string({ search = vim.fn.input("Grep > "), }) end, { desc = "Grep string" })
        end,
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-t>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

        end,
    },

    {
        "Vonr/align.nvim",
        branch = "v2",
        lazy = false,
        init = function() local NS = { noremap = true, silent = true, }
            vim.keymap.set("x", "aa", function() require("align").align_to_char({ length = 1, }) end, NS)
            vim.keymap.set("x", "ad", function() require("align").align_to_char({ preview = true, length = 2, }) end, NS)
            vim.keymap.set("x", "aw", function() require("align").align_to_string({ preview = true, regex = false, }) end, NS)
            vim.keymap.set("x", "ar", function() require("align").align_to_string({ preview = true, regex = true, }) end, NS)
        end,
    },
}, {
    checker = {
        enabled = false,
    },
})

vim.cmd.colorscheme("gruber-darker")
