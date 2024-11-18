--
-- Vim settings
--
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 4
vim.opt.colorcolumn = "80"
--
-- Vim remaps
--
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>rw', function() vim.cmd.Ex() end)

vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set({'n', 'v'}, '<leader>p', [["+p]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

--
-- Harpoon-like bookmarking
--
vim.keymap.set("n", "<C-1>", "mA")
vim.keymap.set("n", "<C-2>", "mB")
vim.keymap.set("n", "<C-3>", "mC")
vim.keymap.set("n", "<C-4>", "mD")

vim.keymap.set("n", "<leader>1", "`A")
vim.keymap.set("n", "<leader>2", "`B")
vim.keymap.set("n", "<leader>3", "`C")
vim.keymap.set("n", "<leader>4", "`D")
