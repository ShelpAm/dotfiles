local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

local function autocmd(events, opts)
    return vim.api.nvim_create_autocmd(events, opts)
end

local function excluded_formatting(filetype)
    local excluded_filetype = { 'xmake' }
    return vim.tbl_contains(excluded_filetype, filetype)
end

autocmd('BufWritePre', {
    group = augroup('format_on_save'),
    callback = function()
        if not excluded_formatting(vim.bo.filetype) then
            vim.lsp.buf.format()
        end
    end,
})

-- Renames tmux window name, when entering or leaving neovim.
-- autocmd({ 'VimEnter', 'VimLeave' }, {
--     callback = function()
--         if vim.env.TMUX_PLUGIN_MANAGER_PATH then
--             vim.uv.spawn(vim.env.TMUX_PLUGIN_MANAGER_PATH .. '/tmux-window-name/scripts/rename_session_windows.py', {})
--         end
--     end,
-- })

local uv = vim.uv

vim.api.nvim_create_autocmd({ 'VimEnter', 'VimLeave' }, {
    callback = function()
        if vim.env.TMUX_PLUGIN_MANAGER_PATH then
            uv.spawn(vim.env.TMUX_PLUGIN_MANAGER_PATH .. '/tmux-window-name/scripts/rename_session_windows.py', {})
        end
    end,
})


-- [[deprecated]]
require('user.core.autocmds.statuscolumn')

require('user.core.autocmds.markdown-textwidth-100')
