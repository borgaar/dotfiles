-- Textwidth and ruler
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"
--vim.opt.formatoptions:remove("t") -- stop automatic newline

-- Tabbing
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2

-- Hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Plugins
require('plugins')

-- Theming
vim.cmd.colorscheme "catppuccin-mocha"

