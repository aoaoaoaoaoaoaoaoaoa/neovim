return {
    "akinsho/bufferline.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    event = "VeryLazy",

    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",

                separator_style = "slant",

                numbers = "none",

                diagnostics = "nvim_lsp",

                diagnostics_indicator = function(_, _, diagnostics)
                    local result = {}

                    for _, n in pairs(diagnostics) do
                        local symbol

                        if n:match("error") then
                            symbol = "󰅚 "
                        elseif n:match("warning") then
                            symbol = "󰀪 "
                        else
                            symbol = "󰋽 "
                        end

                        table.insert(result, symbol .. n)
                    end

                    return table.concat(result, " ")
                end,

                show_buffer_close_icons = true,
                show_close_icon = false,

                color_icons = true,

                always_show_bufferline = true,

                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    },
                },

                groups = {
                    items = {
                        require("bufferline.groups").builtin.pinned:with({
                            icon = "󰐃 ",
                        }),
                    },
                },

                -- indicator = {
                --     style = "underline",
                -- },
            },

            highlights = {
                fill = {
                    bg = "NONE",
                },

                background = {
                    bg = "NONE",
                },

                buffer_selected = {
                    bold = true,
                    italic = false,
                },

                separator = {
                    bg = "NONE",
                },

                separator_selected = {
                    bg = "NONE",
                },

                separator_visible = {
                    bg = "NONE",
                },
            },
        })

    end,
}
