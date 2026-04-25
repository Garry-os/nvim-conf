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

-- Neovide configs
if vim.g.neovide then
	vim.keymap.set('n', '<C-S-v>', '"+p', { noremap = true, silent = true })
	vim.keymap.set('i', '<C-S-v>', '"+p', { noremap = true, silent = true })

	-- Prevents IME errors
	vim.g.neovide_input_ime = false
end

