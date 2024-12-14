-- [DEPRECATED]
-- This file has been deprecated. Now I use `statuscol` plugin to manage
-- statuscolumn.


local function contains(container, element)
    for _, e in ipairs(container) do
        if e == element then
            return true
        end
    end
end


if false then
    local off_statuscolumn = { 'alpha', 'lazy', 'NvimTree' }

    -- Turns off for certain filetypes.
    vim.api.nvim_create_autocmd("FileType", {
        pattern = off_statuscolumn,
        callback = function()
            vim.o.statuscolumn = ''
        end
    })

    -- Turns on for all filetypes.
    vim.api.nvim_create_autocmd("FileType", {
        pattern = '*',
        callback = function()
            if not contains(off_statuscolumn, vim.bo.filetype) then
                vim.o.statuscolumn = '%C%s%=%{v:relnum?v:relnum:v:lnum}  '
            end
        end
    })
end
