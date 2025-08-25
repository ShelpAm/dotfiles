local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

local function should_format(filetype, filename)
    local excluded_filetypes = { 'xmake' }
    local excluded_filenames = { 'xmake.lua' }
    return not vim.tbl_contains(excluded_filetypes, filetype) and
        not vim.tbl_contains(excluded_filenames, filename)
end

vim.api.nvim_create_autocmd('BufWritePre', {
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
