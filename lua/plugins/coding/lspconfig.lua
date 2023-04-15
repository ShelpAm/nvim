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

    end
  },
}
