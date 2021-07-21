-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value) scopes[scope][key] = value if scope ~= 'o' then scopes['o'][key] = value end
end

-------------------- Require -------------------------------
require "plugins"
require "treesitter"
require "autopairs"
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
require "telescope-dap"
-- require 'python'
require "whichkey"
require "custom-highlights"
-- require "tmux"
require "dap-ui"

-------------------- OPTIONS -------------------------------
local indent = 4
-- cmd 'colorscheme desert'                              -- Put your favorite colorscheme here
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
opt('w', 'wrap', true)                                -- Enable line wrap

-- let g:deoplete#enable_at_startup = 1
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
-- let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
g['qs_highlight_on_keys'] = {'f', 'F', 't', 'T'} -- trigger a highlight when pressing these keys:

-- require('material').set()
-- vim.g.material_style = "darker"
vim.cmd[[colorscheme tokyonight]]

vim.g.dap_virtual_text = true
