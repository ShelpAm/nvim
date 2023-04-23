local config = require('user.core.lsp.config')

require('lspconfig').clangd.setup({
  -- Add additional capabilities supported by nvim-cmp
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = config.on_attach,
  settings = {
    root_dir = vim.fs.find('.git', '.clangd', '.clang-format'),
    clangd = {

    },
  },
})
