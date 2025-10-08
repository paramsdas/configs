return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local nvim_lsp = require('lspconfig')
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        on_attach = on_attach
      })
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('gopls')
    end
  },
}
