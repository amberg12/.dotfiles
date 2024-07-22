return {
	{
		"preservim/vim-colors-pencil",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
			vim.cmd('let g:pencil_spell_undercurl=1')
			vim.cmd('colorscheme pencil')
			vim.cmd('set background=light')
		end,
	},
}
