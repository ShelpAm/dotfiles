local M      = {}

local config = require('user.core.lsp.config')

local function get_script_dir()
    local info = debug.getinfo(1)
    local script_path = info.source:sub(2, -1) -- remove the "@" symbol
    return script_path:match("(.*/)")
end

local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

-- Default configurations
local function load_default_config()
    -- print('[debug] Invoking load_default_config')
    local lspconfig = require('lspconfig')
    for _, server in ipairs(config.servers) do
        lspconfig[server].setup({
            -- Add additional capabilities supported by nvim-cmp
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            on_attach = config.default_on_attach,
        })
    end
end

-- Specific configurations
local function load_custom_config()
    -- print('[debug] Invoking load_customc_config')
    for _, server in ipairs(config.servers) do
        if (file_exists(get_script_dir() .. server .. '.lua')) then
            local module_name = 'user.core.lsp.' .. server
            local ok, err = pcall(require, module_name)
            -- print('[Debug] module_name=' .. module_name .. ' ok=' .. tostring(ok))
            if not ok then
                print("Error occurred:", err)
            end
        end
    end
end

function M.setup()
    -- Set up lspconfig
    load_default_config()
    load_custom_config()
    -- vim.lsp.enable(config.servers)
    vim.lsp.set_log_level("ERROR")
end

return M
