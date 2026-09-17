return {
    "lewis6991/gitsigns.nvim",

    opts = {
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, {
                    buffer = bufnr,
                    desc = desc,
                })
            end

            -- Навигация по изменениям
            map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gitsigns.nav_hunk("next")
                end
            end, "Next hunk")

            map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gitsigns.nav_hunk("prev")
                end
            end, "Previous hunk")

            -- Hunks
            map("n", "<leader>ghs", gitsigns.stage_hunk, "Stage hunk")
            map("n", "<leader>ghr", gitsigns.reset_hunk, "Reset hunk")
            map("n", "<leader>ghp", gitsigns.preview_hunk, "Preview hunk")

            -- Весь buffer
            map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage buffer")
            map("n", "<leader>ghR", gitsigns.reset_buffer, "Reset buffer")

            -- Дополнительно
            map("n", "<leader>ghb", function()
                gitsigns.blame_line({ full = true })
            end, "Blame line")

            map("n", "<leader>ghd", gitsigns.diffthis, "Diff")

            map("n", "<leader>ghi", gitsigns.preview_hunk_inline, "Inline hunk")
        end,
    },
}
