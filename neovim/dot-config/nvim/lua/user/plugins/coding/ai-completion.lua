return {
    { -- Not working now
        'codota/tabnine-nvim',
        enabled = false,
        event = { 'VeryLazy' },
        build = "./dl_binaries.sh",
        main = 'tabnine',
        opts = {
            disable_auto_comment = true,
            accept_keymap = "<C-A>",
            dismiss_keymap = "<C-]>",
            debounce_ms = 800,
            suggestion_color = { gui = "#808080", cterm = 244 },
            exclude_filetypes = { "TelescopePrompt" },
            log_file_path = nil, -- absolute path to Tabnine log file
            ignore_certificate_errors = false,
        },
    },
    {
        "monkoose/neocodeium",
        enabled = false,
        event = "VeryLazy",
        config = function()
            local neocodeium = require("neocodeium")
            neocodeium.setup()
            vim.keymap.set("i", "<A-f>", neocodeium.accept)
        end,
    }
}
