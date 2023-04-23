return {
  -- Language server supports
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'williamboman/mason-lspconfig.nvim'
    },
    config = function()
      require('user.core.lsp').setup()
    end
  },
}
