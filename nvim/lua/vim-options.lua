vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    -- Defaults
    vim.cmd('set expandtab')
    vim.cmd('set tabstop=4')
    vim.cmd('set softtabstop=4')
    vim.cmd('set shiftwidth=4')

    if ft == 'c' then
      vim.cmd('set tabstop=8')
      vim.cmd('set softtabstop=8')
      vim.cmd('set shiftwidth=8')
    elseif ft == 'lua' then
      vim.cmd('set tabstop=2')
      vim.cmd('set softtabstop=2')
      vim.cmd('set shiftwidth=2')
    elseif ft == 'make' then
      vim.cmd('set noexpandtab')
    end
  end
})

vim.wo.relativenumber = true
vim.g.mapleader = '\\'
