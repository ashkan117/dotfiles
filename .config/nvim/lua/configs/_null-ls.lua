local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.diagnostics.eslint_d,
  -- null_ls.builtins.diagnostics.credo,
  null_ls.builtins.formatting.mix,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.formatting.markdownlint,
  null_ls.builtins.diagnostics.misspell,
  null_ls.builtins.formatting.black,
  null_ls.builtins.diagnostics.ruff
}

null_ls.setup({ sources = sources })
