-------------------- HELPERS -------------------------------
local g = vim.g      -- a table to access global variables
local opt = vim.opt

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}


local function opts(scope, key, value) scopes[scope][key] = value if scope ~= 'o' then scopes['o'][key] = value end
end

vim.cmd[[colorscheme tokyonight]]

-------------------- OPTIONS -------------------------------
local indent = 2
-- cmd 'colorscheme desert'                              -- Put your favorite colorscheme here
opts('b', 'expandtab', true)                           -- Use spaces instead of tabs
opts('b', 'shiftwidth', indent)                        -- Size of an indent
opts('b', 'smartindent', true)                         -- Insert indents automatically
opts('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opts('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
opts('o', 'hidden', true)                              -- Enable modified buffers in background
opts('o', 'ignorecase', true)                          -- Ignore case
opts('o', 'incsearch', true)                           -- Turn on incremental search
opts('o', 'hlsearch', true)                            -- Get rid of highlights after search
opts('o', 'inccommand', "nosplit")                     -- Show the affect of your search and replace as you type
opts('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opts('o', 'scrolloff', 4 )                             -- Lines of context
opts('o', 'shiftround', true)                          -- Round indent
opts('o', 'sidescrolloff', 8 )                         -- Columns of context
opts('o', 'smartcase', true)                           -- Don't ignore case with capitals
opts('o', 'splitbelow', true)                          -- Put new windows below current
opts('o', 'encoding', 'utf8')                          -- Put new windows below current
opts('o', 'splitright', true)                          -- Put new windows right of current
opts('o', 'termguicolors', true)                       -- True color support
opts('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opts('w', 'list', true)                                -- Show some invisible characters (tabs...)
opts('w', 'number', true)                              -- Print line number
opts('w', 'numberwidth', 2)                              -- Print line number

opts('w', 'relativenumber', true)                      -- Relative line numbers
opts('w', 'wrap', true)                                -- Enable line wrap


opt.ruler = false
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 400
opt.clipboard = "unnamedplus" -- links neovim to system clipboard

-- disable nvim intro
opt.shortmess:append("sI")

-- disable tilde on end of buffer: https://github.com/  neovim/neovim/pull/8546#issuecomment-643643758
vim.cmd("let &fcs='eob: '")

opt.numberwidth = 2
-- opt.relativenumber = true

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>hl")

g.mapleader = " "
g.auto_save = false

-- let g:deoplete#enable_at_startup = 1
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
-- let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
g['qs_highlight_on_keys'] = {'f', 'F', 't', 'T'} -- trigger a highlight when pressing these keys:

-- require('material').set()
-- vim.g.material_style = "darker"

vim.g.dap_virtual_text = true

-- disable builtin vim plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- file extension specific tabbing
-- vim.cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])


