vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { tab = '→ ', trail = '·' }

vim.opt.hlsearch = false

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    { 
      'p00f/alabaster.nvim',
      config = function()
        vim.cmd.colorscheme('alabaster')
      end
    },
    {
      'tpope/vim-sleuth',
      lazy = true,
      ft = '*',
    },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope')
        local builtin = require('telescope.builtin')
        vim.keymap.set(
          'n',
          '<C-p>',
          function()
            builtin.find_files({ hidden = true, file_ignore_patterns = { '.git/*' } })
          end
        )
        vim.keymap.set(
          'n',
          '<leader>fg',
          function()
            builtin.live_grep()
          end
        )
      end,
      lazy = true,
      keys = { '<C-p>', '<leader>fg' },
    },
  }
})

