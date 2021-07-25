-------------------- PLUGINS -------------------------------                                 
vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn
local use = packer.use
return packer.startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- event means only load this plugin on this event
    -- cmd means only load this plugin on this cmd
    --


    -- language related plugins
    use {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require("treesitter-nvim").config()
        end
    }

    use {
        "neovim/nvim-lspconfig",
        event = "BufRead",
        config = function()
            require("nvim-lspconfig").config()
        end
    }

    use "kabouzeid/nvim-lspinstall"

    use {
        "onsails/lspkind-nvim",
        event = "BufRead",
        config = function()
            require("lspkind").init()
        end
    }

    ---- load compe in insert mode only
    use {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("compe-completion").config()
        end,
        wants = {"LuaSnip"},
        requires = {
            {
                "L3MON4D3/LuaSnip",
                wants = "friendly-snippets",
                event = "InsertCharPre",
                config = function()
                    require("compe-completion").snippets()
                end
            },
            "rafamadriz/friendly-snippets"
        }
    }

    use {
        "sbdchd/neoformat",
        cmd = "Neoformat"
    }

    ---- file managing , picker etc
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("nvimTree").config()
        end
    }

    use "kyazdani42/nvim-web-devicons"

    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"},
            {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
            {"nvim-telescope/telescope-media-files.nvim"}
        },
        cmd = "Telescope",
        config = function()
            require("telescope-nvim").config()
        end
    }

    ---- git stuff
    use {
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = function()
            require("gitsigns-nvim").config()
        end
    }

    ---- misc plugins
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end
    }

    use {
        "andymass/vim-matchup",
        event = "CursorMoved"
    }

    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            require("nvim_comment").setup()
        end
    }

    use {"tweekmonster/startuptime.vim", cmd = "StartupTime"}

    ---- load autosave only if its globally enabled
    use {
        "907th/vim-auto-save",
        cond = function()
            return vim.g.auto_save == 1
        end
    }

    ---- smooth scroll
    use {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require("neoscroll").setup()
        end
    }

    use "alvan/vim-closetag" -- for html autoclosing tag

    use {
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
        event = "BufRead",
        setup = function()
            require("misc-utils").blankline()
        end
    }

    -- my plugins
    use {'mhinz/vim-startify'}
    use {'akinsho/nvim-bufferline.lua'}
    use {'nvim-telescope/telescope-dap.nvim'}
    use {'mfussenegger/nvim-dap-python'}
    use { "rcarriga/nvim-dap-ui" }
    use {'mfussenegger/nvim-dap'}
    use {'unblevable/quick-scope'} -- visual cues to enhance f,t motion
    use {'folke/lsp-trouble.nvim'} -- nice IDE like error list
    use {'tpope/vim-unimpaired'} -- next buffer with ]b
    -- JS
    use { 'pangloss/vim-javascript' }
    use {'leafgarland/typescript-vim'}

    -- JSX
    use {'MaxMEllon/vim-jsx-pretty'}
    use {'peitalin/vim-jsx-typescript'}
    ----

    use {'marko-cerovac/material.nvim'}
    use {'ray-x/lsp_signature.nvim'}
    use {'theHamsta/nvim-dap-virtual-text'}
    use 'folke/tokyonight.nvim'
    use({ "aserowy/tmux.nvim" })
    use {"folke/which-key.nvim"}


    --use {'jbyuki/one-small-step-for-vimkind'}
    --use {'shougo/deoplete-lsp'}
    --use {'shougo/deoplete.nvim', hook = fn['remote#host#UpdateRemotePlugins']}
    --use {'ojroques/nvim-lspfuzzy'}
end)




    --use {'machakann/vim-sandwich'}
    --use {'wellle/targets.vim'} -- extends ci' to things like (),commas,

    --use {'ahmedkhalf/lsp-rooter.nvim'} -- cd into the project you open the file on

    ----
    ---- -- snippet support
    ----
    ----

