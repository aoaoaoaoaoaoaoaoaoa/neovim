return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({})

    -- Работа с файлами
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
    vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })

    -- Git
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "git branches" })
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "git commits" })
    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "git status" })

    -- Цветовые схемы
    vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "colorscheme" })
  end,
}
