return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  opts = {
    indent = { char = "│" },
    scope = { enabled = true },

    exclude = {
      filetypes = {
        "dashboard",
        "neo-tree",
        "NvimTree",
        "lazy",
        "mason",
        "help",
        "terminal",
      },
    },
  },
}
