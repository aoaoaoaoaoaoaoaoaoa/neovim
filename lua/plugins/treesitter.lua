return {
  "nvim-treesitter/nvim-treesitter",

  branch = "main",

  lazy = false,

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").setup()

    require("nvim-treesitter").install({
      "bash",
      "css",
      "dockerfile",
      "html",
      "typescript",
      "tsx",
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
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash",
        "css",
        "dockerfile",
        "html",
        "typescript",
        "typescriptreact",
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

      callback = function(args)
        vim.treesitter.start(args.buf)
      end,
    })
  end,
}
