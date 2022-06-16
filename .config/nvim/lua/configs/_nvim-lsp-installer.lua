local lsp_installer = require("nvim-lsp-installer")

require("nvim-lsp-installer").setup({
	ensure_installed = { "sumneko_lua", "tsserver", "volar", "javascript" }, -- ensure these servers are always installed
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})
