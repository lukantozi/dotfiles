local k = vim.keymap.set

-- Telescope
k("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
k("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
k("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
k("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Undotree
k("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

-- Harpoon (minmal)
k("n", "<leader>a", function() require("harpoon.mark").add_file() end)
k("n", "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end)

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File tree" })
vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFile<CR>", { desc = "Reveal in tree" })

