local lsp_zero = require("lsp-zero")

local cmp = require("cmp")
local cmp_select = { behaviour = cmp.SelectBehavior.Select }

-- :help lsp-zero-keybindings
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-S-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	}),
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls", "clangd" },
	handlers = {
		function(server_name)
			if server_name == 'lua_ls' then
				require('lspconfig').lua_ls.setup({
					-- Lisp looking line
					settings = { Lua = { diagnostics = { globals = { "vim" } } } }
				})
			else
				-- Most plugins can be automatically configured like this.
				require('lspconfig')[server_name].setup({})
			end
		end
	}
})
