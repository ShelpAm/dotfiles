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

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap = true, silent = true, buffer = ev.buf }
            local keymaps = require('user.core.keymaps')
            keymaps.map('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame', unpack(bufopts) })
            keymaps.map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
            keymaps.map('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition', unpack(bufopts) })
            -- keymaps.map('n', 'gh', vim.lsp.buf.hover, { desc = '[G]oto [H]over', unpack(bufopts) })
            keymaps.map('n', 'gi', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplemetation', unpack(bufopts) })
            keymaps.map('n', 'gr', vim.lsp.buf.references, { desc = '[G]oto [R]eference', unpack(bufopts) })
            keymaps.map('n', '<leader>d', '<Cmd>Telescope lsp_document_symbols<CR>', bufopts)
        end,
    })

    local config = require('user.core.lsp.config')
    vim.lsp.enable(config.servers)

    -- Overriding can be placed here.
    -- Unusable
    -- for _, server in ipairs(config.servers) do
    --     vim.lsp.config(server, {
    --         on_attach = config.default_on_attach,
    --     })
    -- end

    vim.lsp.inlay_hint.enable(false)
    vim.lsp.set_log_level("error")
end

return M
