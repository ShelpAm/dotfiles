local M = {}

local config = require('user.core.lsp.config')

-- Default configurations
local function load_default_config()
    -- print('[Debug] Invoking load_default_config')
    local lspconfig = require('lspconfig')
    for _, server in ipairs(config.servers) do
        lspconfig[server].setup({
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = config.default_on_attach,
        })
    end
end

-- Specific configurations
local function load_user_config()
    -- print('[Debug] Invoking load_specific_config')
    for _, server in ipairs(config.servers) do
        local module_name = 'user.core.lsp.' .. server
        local ok, _ = pcall(require, module_name)
        -- print('[Debug] module_name=' .. module_name .. ' ok=' .. tostring(ok))
    end
end

function M.setup()
    load_default_config()
    load_user_config()
end

return M
