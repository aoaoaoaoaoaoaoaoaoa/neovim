return {
    "akinsho/bufferline.nvim",

    version = "*",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    event = "VeryLazy",

    config = function()
        vim.opt.termguicolors = true

        require("bufferline").setup({
            options = {
                -- Работаем именно с буферами
                mode = "buffers",

                -- Без номеров перед именами
                numbers = "none",

                -- Диагностика LSP
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

                -- Иконки файлов
                color_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = false,

                -- Отступ под NvimTree
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    },
                },

                -- Закреплённые буферы
                groups = {
                    items = {
                        require("bufferline.groups").builtin.pinned:with({
                            icon = "󰐃 ",
                        }),
                    },
                },
            },
        })

        -- Dashboard: прячем всю верхнюю линию
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "dashboard",
            callback = function()
                vim.opt_local.showtabline = 0
            end,
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                if vim.bo.filetype ~= "dashboard" then
                    vim.opt.showtabline = 2
                end
            end,
        })

        vim.schedule(function()
            if vim.bo.filetype == "dashboard" then
                vim.opt.showtabline = 0
            end
        end)
    end,
}
