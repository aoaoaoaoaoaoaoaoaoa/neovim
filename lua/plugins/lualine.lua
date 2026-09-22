return {
    "nvim-lualine/lualine.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    event = "VeryLazy",

    config = function()
        vim.opt.laststatus = 3

        local function lsp()
            local clients = vim.lsp.get_clients({
                bufnr = 0,
            })

            if #clients == 0 then
                return "󰒋 no LSP"
            end

            return "󰒋 " .. clients[1].name
        end

        require("lualine").setup({
            options = {
                theme = "catppuccin-nvim",

                icons_enabled = true,

                section_separators = {
                    left = "",
                    right = "",
                },

                component_separators = {
                    left = "",
                    right = "",
                },

                globalstatus = true,

                disabled_filetypes = {
                    statusline = {
                        "NvimTree",
                    },
                },
            },

            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str)
                            return str:upper()
                        end,
                    },
                },

                lualine_b = {
                    {
                        "branch",
                        icon = "",
                    },
                },

                lualine_c = {
                    {
                        "diff",
                        symbols = {
                            added = " ",
                            modified = " ",
                            removed = " ",
                        },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict

                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end

                            return nil
                        end,
                    },

                    {
                        "diagnostics",
                        symbols = {
                            error = "󰅚 ",
                            warn = "󰀪 ",
                            info = "󰋽 ",
                            hint = "󰌶 ",
                        },
                    },
                },

                lualine_x = {
                    lsp,
                },

                lualine_y = {
                    "progress",
                },

                lualine_z = {
                    "location",
                },
            },
        })
    end,
}
