vim.pack.add {
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" }
}

require("tree-sitter-manager").setup({
    -- Default Options
    -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session. If set to "all", install all parsers.
    -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
    auto_install = true, -- if enabled, install missing parsers when editing a new file
    highlight = {},      -- treesitter highlighting is enabled by default
    -- languages = {}, -- override or add new parser sources
})


--- Unused, maybe later we can give it a try.
-- https://github.com/neovim-treesitter/nvim-treesitter

--- Unusable
-- vim.pack.add({ "https://github.com/arborist-ts/arborist.nvim", })
-- require("arborist").setup({
--     install_popular = false
-- })


--- ARCHIVED neovim-treesitter
-- local gh = require('config').gh
-- vim.api.nvim_create_autocmd("PackChanged", {
--     callback = function(ev)
--         local name, kind = ev.data.spec.name, ev.data.kind
--         if name == 'nvim-treesitter' and kind == 'update' then
--             if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
--             vim.cmd('TSUpdate')
--         end
--     end,
-- })
-- vim.pack.add({ gh("nvim-treesitter/nvim-treesitter") })
-- require('nvim-treesitter').setup({
--     sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
--     auto_install = true,  -- Automatically install missing parsers when entering buffer
-- })
--
-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = { 'lua', 'cpp', 'c' },
--     callback = function()
--         print(string.format("Treesitter: Loaded parser for %s", vim.bo.filetype))
--
--         -- Highlighting
--         vim.treesitter.start()
--
--         -- Indentation
--         vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--     end,
-- })
