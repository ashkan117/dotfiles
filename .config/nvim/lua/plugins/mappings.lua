
local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
vim.cmd("inoremap jk <Esc>")

-- map('i', '<jk>', '<ESC>', {expr = true, noremap = true}) map('n', '<C-h>', '<C-w>h') map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<leader>lr', ':s/<C-r><C-w>//g<left><left>') -- local replace: replace the word under cursor with something 
map('n', '<CR>', ':noh<CR>')
-- <esc> :noh<return><esc>
--
-- set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- useful subsitute commands
vim.o.inccommand = "nosplit"
vim.o.ignorecase = true

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Telescope
local opt = {}
map("n", "<Leader>gt", [[<Cmd> Telescope git_status <CR>]], opt)
map("n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<Leader>ff", [[<Cmd> Telescope find_files <CR>]], opt)
map("n", "<Leader>fg", [[<Cmd> Telescope live_grep <CR>]], opt)
map("n", "<Leader>fp", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], opt)
map("n", "<Leader>fb", [[<Cmd>Telescope buffers<CR>]], opt)
map("n", "<Leader>fh", [[<Cmd>Telescope help_tags<CR>]], opt)
map("n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]], opt)

-- AutoFormat
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js FormatWrite
augroup END
]], true)



map('n', '<leader>xx', '<cmd>LspTroubleToggle<CR>',{silent = true, noremap = true})  -- Toggles the trouble list