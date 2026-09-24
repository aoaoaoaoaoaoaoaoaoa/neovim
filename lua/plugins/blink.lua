return {
    "saghen/blink.cmp",

    version = "1.*",

    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    event = "InsertEnter",

    opts = {
        keymap = {
            preset = "default",

            ["<CR>"] = { "accept", "fallback" },

            ["<Tab>"] = {
                "select_next",
                "snippet_forward",
                "fallback",
            },

            ["<S-Tab>"] = {
                "select_prev",
                "snippet_backward",
                "fallback",
            },
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            menu = {
                enabled = true,

                min_width = 30,
                max_height = 10,

                border = "rounded",

                winblend = 0,

                draw = {
                    padding = 1,
                    gap = 1,

                    columns = {
                        {
                            "label",
                            "label_description",
                            gap = 1,
                        },
                        {
                            "kind_icon",
                            "kind",
                        },
                    },
                },
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,

                window = {
                    min_width = 45,
                    max_width = 80,
                    max_height = 20,

                    border = "rounded",

                    winblend = 0,

                    direction_priority = {
                        menu_north = {
                            "e",
                            "w",
                            "n",
                            "s",
                        },

                        menu_south = {
                            "e",
                            "w",
                            "s",
                            "n",
                        },
                    },
                },
            },

            ghost_text = {
                enabled = true,
                show_with_selection = true,
                show_with_menu = true,
            },
        },

        snippets = {
            preset = "default",
        },

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
        },

        signature = {
            enabled = true,
        },
    },
}
