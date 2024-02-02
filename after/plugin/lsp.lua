local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- don't add this function in the `on_attach` callback.
-- `format_on_save` should run only once, before the language servers are active.
lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
    ['rust_analyzer'] = {'rust'},
  }
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver', 'eslint', 'lua_ls', 'rust_analyzer',
    'golangci_lint_ls', 'gopls'
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup
      {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim',
                'require'
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }
    end,
  },
})

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()

cmp.setup({
  formatting = cmp_format,
  mapping = cmp.mapping.preset.insert({
    -- scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
})

-- local lsp = require('lsp-zero').preset({})

-- lsp.preset("recommended")

-- lsp.ensure_installed({
-- 'tsserver', 'eslint', 'lua_ls', 'rust_analyzer',
-- 'golangci_lint_ls', 'gopls'
-- })
-- 
-- lsp.on_attach(function(client, bufnr)
-- -- see :help lsp-zero-keybindings
-- -- to learn the available actions
-- lsp.default_keymaps({buffer = bufnr})
-- end)
-- 
-- -- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- 
-- lsp.setup()
