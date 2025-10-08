-- Custom functionskey
local save = function()
  if vim.fn.getbufvar(vim.fn.bufnr(), '&modified') == 1 then
    vim.cmd('write')
  end
end

-- Nvim keymaps
vim.keymap.set('n', '<Leader>ef', function()
  vim.diagnostic.open_float()
end)

vim.keymap.set('n', '<Leader>ei', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)

vim.keymap.set('n', '<Leader>el', function()
  if vim.diagnostic.config().virtual_lines then
		vim.diagnostic.config({ virtual_lines = false })
	else
		vim.diagnostic.config({ virtual_lines = { current_line = true } })
	end
end, { desc = 'Toggle diagnostic virtual_lines' })

vim.keymap.set('n', '<Leader>fmt', function()
  vim.lsp.buf.format()
end)


vim.keymap.set('n', '<Leader>ff', function()
  save()
  require('telescope.builtin').find_files()
end)

vim.keymap.set('n', '<C-f>', function()
  save()
  require('telescope.builtin').find_files()
end)

vim.keymap.set('i', '<C-f>', function()
  save()
  require('telescope.builtin').find_files()
end)

vim.keymap.set('n', '<Leader>fh', function()
  save()
  require('telescope.builtin').help_tags {}
end)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Telescope buffers' })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<Leader>w", "<CMD>:w<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<Leader>q", "<CMD>:q<CR>", { desc = "Open parent directory" })
