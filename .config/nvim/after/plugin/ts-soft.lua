-- Softer Tree-sitter highlights using your palette, auto-applied after colorscheme
local function hex2rgb(h) return tonumber(h:sub(2,3),16), tonumber(h:sub(4,5),16), tonumber(h:sub(6,7),16) end
local function rgb2hex(r,g,b) return string.format("#%02x%02x%02x", r, g, b) end
-- blend c toward base by factor a (0..1): a=0.6 means 60% base, 40% color
local function blend(color, base, a)
  local cr,cg,cb = hex2rgb(color); local br,bg,bb = hex2rgb(base)
  local r = math.floor(br*a + cr*(1-a) + 0.5)
  local g = math.floor(bg*a + cg*(1-a) + 0.5)
  local b = math.floor(bb*a + cb*(1-a) + 0.5)
  return rgb2hex(r,g,b)
end

local palette = {
  fg       = "#e4e4e4",
  red      = "#e27878",
  orange   = "#f4a261",
  yellow   = "#e7c787",
  green    = "#A6D6A0",
  cyan     = "#89beba",
  blue     = "#84a0c6",
  purple   = "#a093c7",
  muted    = "#7f7f7f",
}

local function apply_soft(alpha)  -- try 0.55–0.75; higher = softer
  local hl = vim.api.nvim_set_hl
  local F  = palette.fg
  local function soft(c) return blend(c, F, alpha) end

  hl(0, "@keyword",         { fg = soft(palette.red) })        -- no bold/italics
  hl(0, "@function",        { fg = soft(palette.blue) })
  hl(0, "@function.call",   { link = "@function" })
  hl(0, "@type",            { fg = soft(palette.yellow) })
  hl(0, "@type.builtin",    { fg = soft(palette.purple) })
  hl(0, "@constant",        { fg = soft(palette.orange) })
  hl(0, "@string",          { fg = soft(palette.green) })
  hl(0, "@number",          { fg = soft(palette.cyan) })
  hl(0, "@boolean",         { fg = soft(palette.cyan) })
  hl(0, "@variable",        { fg = palette.fg })
  hl(0, "@variable.member", { fg = soft(palette.muted) })
  hl(0, "@field",           { link = "@variable.member" })
  hl(0, "@property",        { link = "@variable.member" })
  hl(0, "@punctuation",     { fg = soft(palette.muted) })
end

apply_soft(0.4)  -- <- tweak this number to make colors milder or stronger

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function() apply_soft(0.65) end,
})

