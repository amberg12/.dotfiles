return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				-- A very unlikely name conflict, plus the global
				-- exists in nvim.
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } }
				} },
			})
			lspconfig.clangd.setup({})
		end,
		--Keybindings to access lsp-related features.
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	}
}
