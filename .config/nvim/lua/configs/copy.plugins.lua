-------------------- PLUGINS -------------------------------                                 

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn

cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', hook = fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'junegunn/fzf', hook = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}
paq {'hrsh7th/nvim-compe'}
paq {'akinsho/nvim-bufferline.lua'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'}
paq {'tpope/vim-commentary'}
paq {'christoomey/vim-tmux-navigator'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'unblevable/quick-scope'} -- visual cues to enhance f,t motion
paq {'machakann/vim-sandwich'}
paq {'folke/lsp-trouble.nvim'} -- nice IDE like error list
paq {'tpope/vim-unimpaired'} -- next buffer with ]b
paq {'mhinz/vim-startify'}
paq {'wellle/targets.vim'} -- extends ci' to things like (),commas,

paq {'9mm/vim-closer'} -- smarter pairing of strings,parenthesis
paq {'andymass/vim-matchup'} -- extension of % (helps go to opposite end of things like (,{, even if/else statements

paq {'jbyuki/one-small-step-for-vimkind'}
paq {'ahmedkhalf/lsp-rooter.nvim'} -- cd into the project you open the file on

-- paq {"folke/which-key.nvim"}

-- snippet support
paq { "hrsh7th/vim-vsnip" }
paq { "hrsh7th/vim-vsnip-integ" }
paq { "rafamadriz/friendly-snippets" }


--  You will also need a comptabile DAP client

paq {'mfussenegger/nvim-dap'}


-- JS
paq { 'pangloss/vim-javascript' }
paq {'leafgarland/typescript-vim'}

-- JSX
paq {'MaxMEllon/vim-jsx-pretty'}
paq {'peitalin/vim-jsx-typescript'}
