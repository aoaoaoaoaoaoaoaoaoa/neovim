return {
    "nanozuki/tabby.nvim",

    event = "VimEnter",

    config = function()
        local theme = {
            fill = "TabLineFill",
            current = "TabLineSel",
            tab = "TabLine",
        }

        require("tabby").setup({
            line = function(line)
                return {
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current()
                            and theme.current
                            or theme.tab

                        return {
                            line.sep("", hl, theme.fill),

                            tab.is_current()
                                and "󰆍"
                                or "󰆣",

                            " ",
                            tab.number(),
                            " ",
                            tab.name(),
                            " ",

                            tab.close_btn(""),

                            line.sep("", hl, theme.fill),

                            hl = hl,
                            margin = " ",
                        }
                    end),

                    hl = theme.fill,
                }
            end,

            option = {
                nerdfont = true,

                tab_name = {
                    name_fallback = function(tabid)
                        return tostring(tabid)
                    end,
                },
            },
        })

        -- показывать Tabby только когда есть 2+ tabpage
        vim.opt.showtabline = 2
    end,
}
