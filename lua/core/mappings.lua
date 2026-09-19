vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', '<C-q>', '<cmd>:q<CR>')
-- Copy all text
vim.keymap.set('n', '<C-a>', '<cmd>%y+<CR>')

-- Saving a file via Ctrl+S
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')

-- NvimTree
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>')

-- BufferLine
vim.keymap.set('n','<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n','<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<C-l>', ':BufferLineCloseOthers<CR>')
-- TodoList
vim.keymap.set('n', '<leader>nl', ':TodoTelescope<CR>')

-- ToggleTerm
vim.keymap.set('n', '<leader>s', ':ToggleTerm direction=float<CR>')

-- Shortcut for fast esc
vim.keymap.set('i', 'jj', '<Esc>')

--BufferLine for closing current Tab
vim.keymap.set('n', '<leader>x', '<cmd>BufferLinePickClose<CR>')

--Conform formatting
vim.keymap.set("n", "<leader>pf", function()
    require("conform").format({
        async = true,
        lsp_format = "fallback",
    })
end, {
    desc = "Format",
})

-- View for saving folders and etc
vim.keymap.set("n", "<leader>pv", "<cmd>mkview<cr>", {
    desc = "Save View",
})

vim.keymap.set("n", "<leader>pd", "<cmd>delview<cr>", {
    desc = "Delete View",
})

-- for path find
vim.keymap.set("n", "<leader>tp", function()
  local path = vim.fn.input("Tree path: ", vim.fn.getcwd() .. "/")

  if path ~= "" then
    require("nvim-tree.api").tree.open()
    require("nvim-tree.api").tree.change_root(path)
  end
end, { desc = "Change root by path" })
