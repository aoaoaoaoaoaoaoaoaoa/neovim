return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,

  config = function()

    require("toggleterm").setup({
      direction = "float",
      size = 20,
      open_mapping = [[<c-\>]],
      shade_terminals = true,
    })

    -- открытие терминала
    vim.keymap.set("n", "<leader>s", "<cmd>ToggleTerm<CR>", { desc = "toggle terminal" })

    -- keymaps внутри терминала
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }

      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

      -- если понадобится перемещение между окнами
      -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        set_terminal_keymaps()
      end,
    })

  end,
}
