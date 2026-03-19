return {
    {
        'github/copilot.vim',
        enabled = false,
        event = { 'BufEnter' },
        build = function()
            vim.cmd [[Copilot setup]]
        end
        ,
        config = function()
            vim.keymap.set('i', '<M-Tab>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.g.copilot_no_tab_map = true
        end
    },
    {
        "zbirenbaum/copilot.lua",
        -- enabled = false,
        dependencies = {
            "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
        },
        cmd = "Copilot",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
    }
}
