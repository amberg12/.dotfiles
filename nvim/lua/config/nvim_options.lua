vim.g.mapleader = "\\"
vim.wo.relativenumber = true

vim.api.nvim_create_user_command('Cset',
	function(opts)
		if opts.fargs[1] == 'c' then
			vim.g.c_syntax_for_h = true
		else
			vim.g.c_syntax_for_h = false
		end
	end,
	{ nargs = 1 }
)
