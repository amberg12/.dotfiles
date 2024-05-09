-- nvim config file
-- This file is licensed under the BSD Zero Clause License.

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    -- Defaults
    vim.cmd("set expandtab")
    vim.cmd("set tabstop=4")
    vim.cmd("set softtabstop=4")
    vim.cmd("set shiftwidth=4")

    if ft == "c" then
      vim.cmd("set tabstop=8")
      vim.cmd("set softtabstop=8")
      vim.cmd("set shiftwidth=8")
    elseif ft == "lua" then
      vim.cmd("set tabstop=2")
      vim.cmd("set softtabstop=2")
      vim.cmd("set shiftwidth=2")
    elseif ft == "make" then
      vim.cmd("set noexpandtab")
    end
  end
})

vim.wo.relativenumber = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
local opts = {}

require("lazy").setup(plugins, opts)
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua", "c", "rust" },
  highlight = { enable = true },
  indent = { enable = true },
})
