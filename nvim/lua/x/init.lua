vim.g.mapleader = " "
vim.keymap.set("n", "<leader>rc", vim.cmd.Ex)

require("x.lazy_init")

vim.cmd("set termguicolors")
vim.cmd("set background=light")
vim.cmd("colorscheme zenbones")

--vim.cmd("colorscheme catppuccin-latte")
