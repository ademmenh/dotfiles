-- in Visual Mode, Copy to clipboard
vim.keymap.set('v', '<Leader>y', '"+y', { desc = 'Copy selection to clipboard' })
-- in Normal Mode, Copy line to clipboard
vim.keymap.set('n', '<Leader>yy', '"+yy', { desc = 'Copy line to clipboard' })

-- Buffers
vim.keymap.set('n', '<C-b>', '<Cmd>BufferNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>', { desc = 'Close buffer' })

