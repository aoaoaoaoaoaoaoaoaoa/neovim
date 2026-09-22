
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.laststatus = 3

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
end

require("core.lazy")
require("core.mappings")
require("core.colors")
require("core.configs")
require("core.autocmds")
