return {
    "folke/snacks.nvim",

    priority = 1000,
    lazy = false,

    opts = {
        -- scroll = {
        --     enabled = true,
        -- },
        animate = {
            fps = 120,
        },
        
        dim = {
            enabled = true,
            scope = {
                min_size = 3,
                max_size = 30,
                siblings = true,
            },
        },

        scope = {
            enabled = true,
        },
    },
}
