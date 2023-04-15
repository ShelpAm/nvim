local M = {}

local function load_default_config()
  -- Default configurations
  local lspconfig = require('lspconfig')
  local config = require('core.lsp.config')
  for _, server in ipairs(config.servers) do
    lspconfig[server].setup({
      --capabilities = require('cmp_nvim_lsp').default_capabilities,
      on_attach = config.on_attach,
    })
  end
end

local function load_specific_config()
  -- Specific configurations
  local config = require('core.lsp.config')
  for _, server in ipairs(config.servers) do
    pcall(require, 'core.lsp.' .. server)
  end
end

function M.setup()
  load_default_config()
  load_specific_config()
end

return M
