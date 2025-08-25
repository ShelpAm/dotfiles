vim.api.nvim_create_autocmd('FileType', {
    pattern = 'c',
    callback = function()
        vim.bo.shiftwidth = 4
        print("vim.bo.shiftwidth = 4")
    end
})
