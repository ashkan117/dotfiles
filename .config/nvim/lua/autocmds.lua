-- Don't show any numbers inside terminals
-- vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

-- -- Don't show status line on certain windows
-- vim.cmd [[ autocmd BufEnter,BufWinEnter,FileType,WinEnter * lua require("core.utils").hide_statusline() ]]


--
vim.cmd [[ augroup highlight_yank autocmd! autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000) augroup END ]]
vim.cmd [[ nnoremap n nzz ]]
vim.cmd [[ nnoremap N Nzz ]]
vim.cmd [[ nnoremap <C-o> <C-o>zz ]]
vim.cmd [[ nnoremap <C-i> <C-i>zz ]]

-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
-- augroup END
-- ]], true)

-- vim.api.nvim_exec([[
-- augroup highlight_yank
--     autocmd!
--     autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
-- augroup END
-- ]], true)
