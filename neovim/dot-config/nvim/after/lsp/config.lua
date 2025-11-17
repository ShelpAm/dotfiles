local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.default_on_attach( --[[client]] _, bufnr)
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local keymaps = require('user.core.keymaps')
    keymaps.map('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame', unpack(bufopts) })
    keymaps.map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
    keymaps.map('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition', unpack(bufopts) })
    -- keymaps.map('n', 'gh', vim.lsp.buf.hover, { desc = '[G]oto [H]over', unpack(bufopts) })
    keymaps.map('n', 'gi', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplemetation', unpack(bufopts) })
    keymaps.map('n', 'gr', vim.lsp.buf.references, { desc = '[G]oto [R]eference', unpack(bufopts) })
    keymaps.map('n', '<leader>d', '<Cmd>Telescope lsp_document_symbols<CR>', bufopts)
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            if client:supports_method('textDocument/completion') then
                vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            end
        end,
    })
end

return M
