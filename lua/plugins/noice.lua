return {
    "folke/noice.nvim",
    event = "VeryLazy",

    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },

    opts = {

        -- timeout для увердомнелний
        -- views = {
        --     notify = {
        --         timeout = 10000,
        --     },
        -- },

        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = false,
            lsp_doc_border = true,
        },
    },
}
