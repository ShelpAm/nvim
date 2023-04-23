local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(client, bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local keymaps = require('user.core.keymaps')
  keymaps.map('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', bufopts)
  keymaps.map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymaps.map('n', 'gr', vim.lsp.buf.references, bufopts)
  keymaps.map('n', '<leader>d', '<Cmd>Telescope lsp_document_symbols<CR>', bufopts)
  keymaps.map('n', '<leader>k', vim.lsp.buf.hover, bufopts)
  keymaps.map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  keymaps.map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
end

--- @hint Use :h lspconfig-all to find out more lsp servers.
M.servers = {
  'bashls',
  'clangd',
  'cmake',
  'lua_ls',
  'quick_lint_js',
}

return M
