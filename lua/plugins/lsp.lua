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
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = nvim_lsp.util.root_pattern("package.json"),
        single_file_support = false
      })
      vim.lsp.enable('ts_ls')
      vim.lsp.config('denols', { capabilities = capabilities })
      vim.lsp.enable('denols')
    end
  },
}
