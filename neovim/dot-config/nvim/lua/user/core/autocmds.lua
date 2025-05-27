local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

local function autocmd(events, opts)
    return vim.api.nvim_create_autocmd(events, opts)
end

local function should_format(filetype, filename)
    local excluded_filetypes = { 'xmake' }
    local excluded_filenames = { 'xmake.lua' }
    return not vim.tbl_contains(excluded_filetypes, filetype) and
        not vim.tbl_contains(excluded_filenames, filename)
end

autocmd('BufWritePre', {
    group = augroup('format_on_save'),
    callback = function(opts)
        local filetype = vim.bo.filetype
        local filename = vim.api.nvim_buf_get_name(opts.buf) -- This gives the full path
        filename = vim.fn.fnamemodify(filename, ':t')        -- :t means tail, gets the file's basename
        -- print("[debug] autocmds.lua filetype: ", filetype, "filename: ", filename)
        if should_format(filetype, filename) then
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
