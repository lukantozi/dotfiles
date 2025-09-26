-- ~/.config/nvim/lua/theprimeagen/lsp.lua

-- ===== nvim-cmp (completion) =====
local cmp     = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ['<CR>']      = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>']     = cmp.mapping(function(fb)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fb() end
    end, {'i','s'}),
    ['<S-Tab>']   = cmp.mapping(function(fb)
      if cmp.visible() then cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
      else fb() end
    end, {'i','s'}),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip'  },
    { name = 'path'     },
    { name = 'buffer'   },
  },
})

-- Tell LSP that completion is available
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Nice default keymaps for LSP buffers
local function on_attach(_, bufnr)
  local map = function(m, lhs, rhs) vim.keymap.set(m, lhs, rhs, {buffer=bufnr, silent=true}) end
  map('n','gd', vim.lsp.buf.definition)
  map('n','gD', vim.lsp.buf.declaration)
  map('n','gi', vim.lsp.buf.implementation)
  map('n','go', vim.lsp.buf.type_definition)
  map('n','gr', vim.lsp.buf.references)
  map('n','K',  vim.lsp.buf.hover)
  map('n','<leader>rn', vim.lsp.buf.rename)
  map('n','<leader>ca', vim.lsp.buf.code_action)
  map('n',']d', vim.diagnostic.goto_next)
  map('n','[d', vim.diagnostic.goto_prev)
  map('n','<leader>f', function() vim.lsp.buf.format({async=true}) end)
end

-- ===== Mason + LSP servers =====
require('mason').setup({})
local lspconfig = require('lspconfig')

require('mason-lspconfig').setup({
  -- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  -- PUT YOUR SERVERS IN THIS LIST; Mason will auto-install them:
  ensure_installed = {
    'lua_ls',         -- Lua
    'pyright',        -- Python
    'clangd',         -- C/C++
    'ts_ls',          -- TypeScript/JS (older setups use 'tsserver'; see note below)
    'jsonls',
    'yamlls',
    'html',
    'cssls',
    'gopls',
    'rust_analyzer' 
  },
  -- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  handlers = {
    -- Default handler for any server you didn't override below
    function(server)
      lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end,

    -- Lua: make it Neovim-friendly
    lua_ls = function()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace   = { checkThirdParty = false },
            telemetry   = { enable = false },
          }
        }
      })
    end,
  },
})

