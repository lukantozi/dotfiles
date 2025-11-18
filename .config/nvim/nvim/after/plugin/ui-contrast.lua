vim.o.winblend = 0
vim.o.pumblend = 0

local function set_ui()
  -- Float background (hover, signature, diagnostics popups)
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#191919", fg = "#e4e4e4" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#191919", fg = "#5e5e5e" })

  -- Matching parentheses: simple subtle white-ish with soft contrast
  vim.api.nvim_set_hl(0, "MatchParen", { fg = "#ffffff", bg = "#2b2b2b", bold = true })
end

set_ui()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_ui
})
