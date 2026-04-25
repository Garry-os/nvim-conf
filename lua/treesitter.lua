local ts_ensure_installed = {
	"c",
	"cpp",
	"python",
	"bash",
	"lua",
	"make"
}

require("nvim-treesitter").install(ts_ensure_installed)
for _, parser in ipairs(ts_ensure_installed) do
  vim.treesitter.language.register(parser, parser)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = parser,
    callback = function(event)
      vim.treesitter.start(event.buf, parser)
    end,
  })
end
