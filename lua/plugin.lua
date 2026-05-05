-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  -- highlight-start
  spec = {
	-- Theme
	{ 'ellisonleao/gruvbox.nvim' },
	
	-- Treesitter
	{
	  'nvim-treesitter/nvim-treesitter',
	  lazy = false,
	  build = ':TSUpdate'
	},

	-- Autopairs
	{
	  'windwp/nvim-autopairs',
	  event = "InsertEnter",
	  config = true
	},

	-- Vim airline
	{ 'vim-airline/vim-airline' },

	-- LSP stuff
	{ 'neovim/nvim-lspconfig' },
	{ 'mason-org/mason.nvim', cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' }, config = true },
	{ 'mason-org/mason-lspconfig.nvim', config = true },

	-- Autocompletions
	{
	  'saghen/blink.cmp',
	  version = '*', -- Use a release tag to ensure stability
	  opts = {
		-- Press enter for autocompletions
		keymap = { preset = 'enter' },

		appearance = {
		  use_nvim_cmp_as_default = true,
		  nerd_font_variant = 'mono'
		},

		-- Sources to enable for completion
		sources = {
		  default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
	  },
	}

  },

  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})


