return {
    {
        'hrsh7th/nvim-cmp',
        enabled = function() -- Disable in commenting, see https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#disabling-completion-in-certain-contexts-such-as-comments
            local disabled = false
            disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
            disabled = disabled or (vim.fn.reg_recording() ~= '')
            disabled = disabled or (vim.fn.reg_executing() ~= '')
            disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
            return not disabled
        end,
        event = { 'BufEnter', },
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'davidsierradz/cmp-conventionalcommits',
            'hrsh7th/cmp-nvim-lsp',
            -- 'hrsh7th/cmp-nvim-lsp-signature-help', -- What does this do?
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local function has_words_before()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local luasnip = require('luasnip')
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-C>'] = cmp.mapping.complete({}),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-E>'] = cmp.mapping.abort(),
                    ['<C-B>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-F>'] = cmp.mapping.scroll_docs(4),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- elseif luasnip.expand_or_jumpable() then
                            --   luasnip.expand_or_jump()
                            --   -- elseif has_words_before() then
                            --   --   cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources(
                    { { name = 'nvim_lsp' } },
                    { { name = 'luasnip' } },
                    {
                        { name = 'path' },
                        { name = 'buffer' },
                    }
                ),
                formatting = {
                    format = require('lspkind').cmp_format(),
                },
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources(
                    { { name = 'conventionalcommits' } },
                    { { name = 'buffer' } },
                    { { name = 'path' } }
                )
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' },
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' },
                }, {
                    { name = 'cmdline' },
                })
            })
        end,
    },
}
