vim.opt.relativenumber = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

vim.keymap.set("x", "<leader>p", "\"_dP")

-- Good keybinds! For using global register easy.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Obsidian scratchpad location for when I don't want to switch from my neovim
-- workflow.
vim.keymap.set("n",
               "<leader>sp",
               "<cmd>:e ~/Obsidian/scratchpad.md<CR>",
               { silent = true })
