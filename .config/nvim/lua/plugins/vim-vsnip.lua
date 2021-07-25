-- local utils = require('utils')
-- local opts = {noremap = false, expr = true}

-- local function map(mode, lhs, rhs, opts)
--     local options = {noremap = true}
--     if opts then options = vim.tbl_extend('force', options, opts) end
--     vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end


-- function _G.tab_vsnip()
--     if vim.fn.call("vsnip#jumpable", {1}) then
--         return utils.t "<Plug>(vsnip-jump-next)"
--     else
--         return utils.t "<Tab>"
--     end
-- end

-- function _G.s_tab_vsnip()
--     if vim.fn.call("vsnip#jumpable", {-1}) then
--         return utils.t "<Plug>(vsnip-jump-prev)"
--     else
--         return utils.t "<Tab>"
--     end
-- end

-- map('i', '<Tab>', 'v:lua.tab_vsnip', opts)
-- map('s', '<Tab>', 'v:lua.tab_vsnip', opts)
-- map('i', '<Tab>', 'v:lua.s_tab_vsnip', opts)
-- map('s', '<Tab>', 'v:lua.s_tab_vsnip', opts)
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-- map('s', '<Tab>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']], opts)
-- map('i', '<S-Tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], opts)
-- map('s', '<S-Tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], opts)

-- map('<expr> <C-j>'   [[vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>']]
-- imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
-- smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
