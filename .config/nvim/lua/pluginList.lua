-------------------- PLUGINS -------------------------------                                 
local present, _ = pcall(require, "packerInit")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn

return require('packer').startup(function()
    -- Packer can manage itself
    use { 
        'wbthomason/packer.nvim',
        event = "VimEnter"
    }
    -- Plugins can have dependencies on other plugins
    -- use {
    --   'haorenW1025/completion-nvim',
    --   opt = true,
    --   requires = {{'hrsh-7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
    -- }

    use {'shougo/deoplete-lsp'}
    use {
        'shougo/deoplete.nvim', 
        hook = fn['remote#host#UpdateRemotePlugins']
    }
    use { 
        "windwp/nvim-autopairs",  -- smarter pairing of strings,parenthesis
        after = "nvim-compe",
        config = function()
            require "plugins.nvim-compe"
        end
    }
    use {
        'mhartington/formatter.nvim',
        config = function()
            require "plugins.formatter"
        end
    }
    use {"dstein64/vim-startuptime"}
    use {'tpope/vim-fugitive'}
    use {
        'nvim-treesitter/nvim-treesitter',
        event = "BufRead",
        config = function()
            require "plugins.treesitter"
        end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require "plugins.nvim-lspconfig"
        end
    }
    use {
        "kabouzeid/nvim-lspinstall",
        event = "BufRead"
    }
    use {
        'mfussenegger/nvim-lint',
        config = function()
            require "plugins.nvim-lint"
        end
    }
    use {
        'junegunn/fzf', 
        hook = fn['fzf#install']
    }
    use {'junegunn/fzf.vim'}
    use {'ojroques/nvim-lspfuzzy'}
    use {
        'hrsh7th/nvim-compe',
        event = "InsertEnter",
        wants = "LuaSnip",
        requires = {
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = function()
                    require "plugins.luasnip"
                end
            },
            {
                "rafamadriz/friendly-snippets",
                event = "InsertCharPre"
            }
        }
    }
    use {
        'akinsho/nvim-bufferline.lua',
        config = function()
            require "plugins.top-bufferline"
        end
    }
    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require "plugins.icons"
        end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        config = function()
            require "plugins.nvimTree"
        end
    }
    use {'tpope/vim-commentary'}
    use {
        'nvim-lua/popup.nvim',
        after = "plenary.nvim"
    }
    use {
        'nvim-lua/plenary.nvim',
        event = "BufRead"
    }
    use {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require "plugins.telescope-nvim"
        end,
        requires = {
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"},
            {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope"},
            {"nvim-telescope/telescope-media-files.nvim", cmd = "Telescope"}
        },
    }
    use {
        'nvim-telescope/telescope-dap.nvim',
        config = function()
            require "plugins.telescope-dap"
        end
    }
    use {'mfussenegger/nvim-dap-python'}
    use { 
        "rcarriga/nvim-dap-ui",
        config = function()
            require "plugins.dap-ui"
        end
    }
    use {
        'mfussenegger/nvim-dap',
        config = function()
            require "plugins.nvim-dap"
        end
    }

    use {'unblevable/quick-scope'} -- visual cues to enhance f,t motion
    use {'machakann/vim-sandwich'}
    -- use {'folke/lsp-trouble.nvim'} -- nice IDE like error list
    -- use {'tpope/vim-unimpaired'} -- next buffer with ]b
    use {
        'mhinz/vim-startify',
        config = function()
            require "plugins.startify"
        end
    }
    use {'wellle/targets.vim'} -- extends ci' to things like (),commas,
    
    -- extension of % (helps go to opposite end of things like (,{, even if/else statements
    use {
        'andymass/vim-matchup',
        event = "CursorMoved"
    } 

    use {'jbyuki/one-small-step-for-vimkind'}
    use {
        "folke/which-key.nvim",
        config = function()
            require "plugins.whichkey"
        end
    }
    --
    -- -- snippet support
    use { 
        "hrsh7th/vim-vsnip",
        config = function()
            require "plugins.vim-vsnip"
        end
    }
    use { "hrsh7th/vim-vsnip-integ" }
    --
    --  You will also need a comptabile DAP client

    --
    --
    -- -- JS
    use { 'pangloss/vim-javascript' }
    use {'leafgarland/typescript-vim'}
    --
    -- -- JSX
    use {'MaxMEllon/vim-jsx-pretty'}
    use {'peitalin/vim-jsx-typescript'}
    --

    use {'marko-cerovac/material.nvim'}
    use {'ray-x/lsp_signature.nvim'}
    use {'theHamsta/nvim-dap-virtual-text'}
    use {
        "tweekmonster/startuptime.vim",
        cmd = "StartupTime"
    }
    use 'folke/tokyonight.nvim'
    use({
        "aserowy/tmux.nvim",
        config = function()
            require "plugins.tmux"
        end
    })
end
