-------------------- HELPERS -------------------------------
-- local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
-- local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
-- local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

-------------------- Require -------------------------------
local chad_modules = {
    "options",
    "mappings",
    "utils"
}

for i = 1, #chad_modules, 1 do
    pcall(require, chad_modules[i])
end

-- let g:deoplete#enable_at_startup = 1
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
-- let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
g['qs_highlight_on_keys'] = {'f', 'F', 't', 'T'} -- trigger a highlight when pressing these keys:

-- require('material').set()
-- vim.g.material_style = "darker"
vim.cmd[[colorscheme tokyonight]]

vim.g.dap_virtual_text = true
