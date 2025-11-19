return { {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip' },

    event = { 'BufEnter' },
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            -- set to 'none' to disable the 'default' preset
            preset = 'none',

            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<Enter>'] = { 'accept', 'fallback' },

            ['<C-e>'] = { function(cmp) cmp.hide() end },

            ['<C-c>'] = { 'show' },
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        cmdline = {
            completion = {
                list = { selection = { preselect = false, auto_insert = true } },
                menu = { auto_show = true }
            },
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            keyword = { range = 'prefix' },
            accept = { auto_brackets = { enabled = false }, },
            list = { selection = { preselect = true, auto_insert = true } },
            menu = { auto_show = true },
            documentation = { auto_show = true }
        },

        snippets = { preset = 'luasnip' },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets'
                -- Disable buffer; by default it's only enabled when LSP returns no items.
                -- , 'buffer'
            },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },

        signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
} }
