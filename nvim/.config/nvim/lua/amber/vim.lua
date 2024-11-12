--
-- Vim settings
--
vim.opt.nu = true
vim.opt.relativenumber = true

--
-- Vim remaps
--
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>rw', function() vim.cmd.Ex() end)

vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set({'n', 'v'}, '<leader>p', [["+p]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
