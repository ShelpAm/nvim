local config = require('user.core.lsp.config')

require('lspconfig').lua_ls.setup({
  -- Add additional capabilities supported by nvim-cmp
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = config.on_attach,
  settings = {
    root_dir = vim.fs.dirname('lua'),
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
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
})
