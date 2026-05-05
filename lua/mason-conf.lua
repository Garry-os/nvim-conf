require("mason-lspconfig").setup({
    -- Automatically install these servers if they are missing
    ensure_installed = { "lua_ls", "pyright", "clangd" },

    -- (Optional) Automatically install LSPs you've configured with lspconfig
    automatic_installation = true, 
})

if vim.lsp.config then
  vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
  })
end

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
    }
  }
})
vim.lsp.enable('lua_ls')

vim.lsp.config('pyright', {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
      },
    },
  }
})
vim.lsp.enable('pyright')

vim.lsp.config('clangd', {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
})
vim.lsp.enable('clangd')

