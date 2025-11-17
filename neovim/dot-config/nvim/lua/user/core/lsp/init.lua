local M = {}

--- Mostly DEPRECATED. Please use `vim.lsp` instead.

-- local function get_script_dir()
--     local info = debug.getinfo(1)
--     local script_path = info.source:sub(2, -1) -- remove the "@" symbol
--     return script_path:match("(.*/)")
-- end
--
-- local function file_exists(name)
--     local f = io.open(name, "r")
--     if f ~= nil then
--         io.close(f)
--         return true
--     else
--         return false
--     end
-- end
--
-- -- Default configurations
-- local function load_default_config()
--     -- print('[debug] Invoking load_default_config')
--     local lspconfig = require('lspconfig')
--     for _, server in ipairs(config.servers) do
--         lspconfig[server].setup({
--             -- Add additional capabilities supported by nvim-cmp
--             capabilities = require('cmp_nvim_lsp').default_capabilities(),
--             on_attach = config.default_on_attach,
--         })
--     end
-- end
--
-- -- Specific configurations
-- local function load_custom_config()
--     -- print('[debug] Invoking load_customc_config')
--     local script_dir = get_script_dir()
--     for _, server in ipairs(config.servers) do
--         if (file_exists(script_dir .. server .. '.lua')) then
--             local module_name = 'user.core.lsp.' .. server
--             local ok, err = pcall(require, module_name)
--             -- print('[Debug] module_name=' .. module_name .. ' ok=' .. tostring(ok))
--             if not ok then
--                 print("error(user.core.lsp): ", err)
--             end
--         end
--     end
-- end

function M.setup()
    -- Set up lspconfig
    -- load_default_config()
    -- load_custom_config()
    local config = require('user.core.lsp.config')
    vim.lsp.enable(config.servers)

    -- Overriding can be placed here.
    -- for _, server in ipairs(config.servers) do
    --     vim.lsp.config(server, {
    --         on_attach = config.default_on_attach,
    --     })
    -- end

    vim.lsp.inlay_hint.enable(false)
    vim.lsp.set_log_level("error")
end

return M
