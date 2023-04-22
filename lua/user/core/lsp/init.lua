local M = {}

local config = require('user.core.lsp.config')

local function load_default_config()
  -- Default configurations
  local lspconfig = require('lspconfig')
  for _, server in ipairs(config.servers) do
    print(server)
    lspconfig[server].setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = config.on_attach,
    })
  end
end

local function load_specific_config()
  -- Specific configurations
  for _, server in ipairs(config.servers) do
    pcall(require, 'user.core.lsp.' .. server)
  end
end

function M.setup()
  load_default_config()
  load_specific_config()
end

return M
