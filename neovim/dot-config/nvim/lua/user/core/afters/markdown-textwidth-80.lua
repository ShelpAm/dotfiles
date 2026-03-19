vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        -- Prints out current file is loading.
        -- print("debug: detected FileType is markdown")
        vim.bo.textwidth = 80
        vim.opt.shiftwidth = 2
    end
})
