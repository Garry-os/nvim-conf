require("plugin")

-- Basic options
vim.opt.number = true
vim.opt.mouse = a

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.syntax = on

-- Plugins
-- Theme
vim.cmd.colorscheme('gruvbox')
vim.opt.termguicolors = true

-- Treesitter
require("treesitter")

