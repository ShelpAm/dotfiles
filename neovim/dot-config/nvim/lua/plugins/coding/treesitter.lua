local gh = require('config').gh

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end,
})

vim.pack.add({ gh("nvim-treesitter/nvim-treesitter") })
require('nvim-treesitter').setup({
    sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
    auto_install = true,  -- Automatically install missing parsers when entering buffer
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- TODO: doesn't know if loaded, need check
