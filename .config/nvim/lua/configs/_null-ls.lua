local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.diagnostics.eslint_d,
}

null_ls.setup({ sources = sources })
