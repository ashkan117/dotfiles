-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value) scopes[scope][key] = value if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-------------------- Require -------------------------------
require "plugins"
require "treesitter"
require "nvim-lspconfig"
require "nvim-lint"
require "telescope-nvim"
require "nvimTree"
require "mappings"
require "startify"
require "icons"
require "top-bufferline"
require "nvim-dap"
require "vim-vsnip"
require "nvim-compe"
require('dap-python').setup('/usr/bin/python3')
require('telescope').load_extension('dap')
require "telescope-dap"
-- require 'python'
require "whichkey"
require "custom-highlights"
require "tmux"
require "dap-ui"

-------------------- OPTIONS -------------------------------
local indent = 4
cmd 'colorscheme desert'                              -- Put your favorite colorscheme here
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', true)                      -- Relative line numbers
opt('w', 'wrap', false)                               -- Disable line wrap

-------------------- MAPPINGS ------------------------------

map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables


options = { noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
vim.api.nvim_set_keymap('n', '<Leader><Space>', ':set hlsearch!<CR>', { noremap = true, silent = true })

map('', '<leader>c', '"+y')       -- Copy to clipboard in normal, visual, select and operator modes
map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

map('n', '<C-l>', '<cmd>noh<CR>')    -- Clear highlights
map('n', '<leader>o', 'm`o<Esc>``')  -- Insert a newline in normal mode
map('n', '<leader>xx', '<cmd>LspTroubleToggle<CR>',{silent = true, noremap = true})  -- Toggles the trouble list

-------------------- TREE-SITTER ---------------------------
-- local ts = require 'nvim-treesitter.configs'
-- ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-- Quick-Scope
-- " Trigger a highlight only when pressing f and F.

-------------------- WINDOW-OPTIONS ---------------------------
vim.wo.wrap = true
vim.wo.number = true



-- let g:deoplete#enable_at_startup = 1
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
-- let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
g['qs_highlight_on_keys'] = {'f', 'F', 't', 'T'} -- trigger a highlight when pressing these keys:

-- hide line numbers in terminal windows
vim.api.nvim_exec([[
   au BufEnter term://* setlocal nonumber
]], false)

-- set debug=throw
--
-- require('material').set()
-- vim.g.material_style = "darker"
vim.cmd[[colorscheme tokyonight]]

vim.g.dap_virtual_text = true
