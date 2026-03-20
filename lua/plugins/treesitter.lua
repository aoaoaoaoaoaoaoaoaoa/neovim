return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "master",
  event = { "BufReadPost", "BufNewFile" },

  opts = {
    ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "html",
      "javascript",
      "json",
      "json5",
      "lua",
      "python",
      "vim",
      "yaml",
      "c",
      "go",
      "rust",
    },

    sync_install = false,
    auto_install = true,

    highlight = {
      enable = true,
    },

    indent = {
      enable = true,
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
