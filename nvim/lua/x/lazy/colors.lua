return {{
  "zenbones-theme/zenbones.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("set termguicolors")
    vim.cmd("set background=light")
    vim.cmd("colorscheme zenbones")
  end
}}
