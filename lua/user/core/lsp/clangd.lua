local config = require('user.core.lsp.config')

require('lspconfig').clangd.setup({
  -- Add additional capabilities supported by nvim-cmp
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = config.on_attach,
  settings = {
    root_dir = vim.fs.find('.git', '.clangd', '.clang-format'),
    clangd = {
      arguments = {
        "--all-scopes-completion",
        '--background-index',
        "--compile-commands-dir=build/Debug",
        '--clang-tidy',
        "--clang-tidy-checks=performance-*,bugprone-*",
        '--compile-commands-dir=build',
        "--completion-style=detailed",
        '--function-arg-placeholders',
        "--header-insertion=iwyu",
        "--j=4",
        "--log=error",
        "--pch-storage=disk",
      },
    },
  },
})
