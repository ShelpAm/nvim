return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'davidsierradz/cmp-conventionalcommits',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
    },
    event = { 'BufEnter', },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete({}),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-C>'] = cmp.mapping.abort(),
          ['<C-U>'] = cmp.mapping.scroll_docs(-4),
          ['<C-D>'] = cmp.mapping.scroll_docs(4),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = require('lspkind').cmp_format(),
        },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'conventionalcommits' },
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  },
}
