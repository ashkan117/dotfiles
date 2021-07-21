-------------------- PLUGINS -------------------------------                                 
vim.cmd [[packadd packer.nvim]]

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

    -- use {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
    use {'shougo/deoplete-lsp'}
    use {'shougo/deoplete.nvim', hook = fn['remote#host#UpdateRemotePlugins']}
    use { 
        "windwp/nvim-autopairs",  -- smarter pairing of strings,parenthesis
         after = "nvim-compe",
    }
    use {'mhartington/formatter.nvim'}
    use {"dstein64/vim-startuptime"}
    use {'tpope/vim-fugitive'}
    use {
        'nvim-treesitter/nvim-treesitter',
        event = "BufRead",
    }
    use {'neovim/nvim-lspconfig'}
        use {
            "kabouzeid/nvim-lspinstall",
            event = "BufRead"
        }
    use {'mfussenegger/nvim-lint'}
    use {'junegunn/fzf', hook = fn['fzf#install']}
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
    use {'akinsho/nvim-bufferline.lua'}
    use {'kyazdani42/nvim-web-devicons'}
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = "NvimTreeToggle",
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
        requires = {
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"},
            {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope"},
            {"nvim-telescope/telescope-media-files.nvim", cmd = "Telescope"}
        },
    }
    use {'nvim-telescope/telescope-dap.nvim'}
    use {'mfussenegger/nvim-dap-python'}
    use { "rcarriga/nvim-dap-ui" }
    use {'mfussenegger/nvim-dap'}

    use {'unblevable/quick-scope'} -- visual cues to enhance f,t motion
    use {'machakann/vim-sandwich'}
    -- use {'folke/lsp-trouble.nvim'} -- nice IDE like error list
    -- use {'tpope/vim-unimpaired'} -- next buffer with ]b
    use {'mhinz/vim-startify'}
    use {'wellle/targets.vim'} -- extends ci' to things like (),commas,

    use {
        'andymass/vim-matchup',
          event = "CursorMoved"
    } -- extension of % (helps go to opposite end of things like (,{, even if/else statements

    use {'jbyuki/one-small-step-for-vimkind'}
    use {"folke/which-key.nvim"}
    --
    -- -- snippet support
    use { "hrsh7th/vim-vsnip" }
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
        require("tmux").setup({
            -- overwrite default configuration
            -- here, e.g. to enable default bindings
            copy_sync = {
                -- enables copy sync and overwrites all register actions to
                -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
                enable = true,
            },
            navigation = {
                -- enables default keybindings (C-hjkl) for normal mode
                enable_default_keybindings = true,
            },
            resize = {
                -- enables default keybindings (A-hjkl) for normal mode
                enable_default_keybindings = true,
            }
        })
    end
})


end)
