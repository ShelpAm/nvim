return {
  -- Language server supports
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim'
    },
    event = {
      'BufEnter',
    },
    config = function()
      local lsp = require('core.lsp')
      local lspconfig = require('lspconfig')
      for _, server in ipairs(lsp.servers) do
        lspconfig[server].setup({
          --capabilities = require('cmp_nvim_lsp').default_capabilities,
          on_attach = lsp.on_attach,
        })
      end

      require('core.lsp.lua_ls').setup()
    end
  },
}
