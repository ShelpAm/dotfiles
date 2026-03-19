return { {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        interactions = {
            chat = {
                adapter = "copilot",
                model = "gemini-3.1-pro",
                tools = {
                    ["run_command"] = {
                        opts = {
                            -- require_approval_before = false,
                            allowed_in_yolo_mode = true,
                        },
                    },
                },
            },
        },
        -- NOTE: The log_level is in `opts.opts`
        opts = {
            log_level = "DEBUG",
        },
    },
}, }
