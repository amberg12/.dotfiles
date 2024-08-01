local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    })
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = "x.lazy",
  change_detection = { notify = false },
})

require("x.lsp_config")
require("x.bind")
