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
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('svelte')
      vim.lsp.enable('cssls')
      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.lsp.config('html', {
        capabilities = capabilities,
        filetypes = { 'html', 'templ', 'svelte'}
      })
      vim.lsp.enable('html')
    end
  },
}
