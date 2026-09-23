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

                -- component_separators = {
                --     left = "",
                --     right = "",
                -- },

                globalstatus = true,

                disabled_filetypes = {
                    statusline = {
                        "NvimTree",
                        "dashboard"
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
                        separator = "",
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

            tabline = {
                lualine_a = {
                    {
                        "buffers",

                        show_filename_only = true,
                        hide_filename_extension = false,
                        show_modified_status = true,

                        mode = 0,

                        -- max_length = vim.o.columns * 2 / 3,

                        use_mode_colors = true,

                        buffers_color = {
                            active = "lualine_a_normal",
                            inactive = "lualine_b_normal",
                        },

                        component_separators = {
                            left = "",
                            right = "",
                        },

                        symbols = {
                            modified = " ●",
                            alternate_file = "",
                            directory = "",
                        },
                    },
                },

                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },

        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "dashboard",
            callback = function()
                vim.opt_local.showtabline = 0
            end,
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                if vim.bo.filetype == "dashboard" then
                    vim.opt_local.showtabline = 0
                else
                    vim.opt.showtabline = 2
                end
            end,
        })

        vim.schedule(function()
            if vim.bo.filetype == "dashboard" then
                vim.opt_local.showtabline = 0
            else
                vim.opt.showtabline = 2
            end
        end)

    end,
}
