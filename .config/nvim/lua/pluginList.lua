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

return packer.startup(
    function()

        -- use {
        --     'machakann/vim-highlightedyank'
        -- }

        -- Packer can manage itself
        use { 
            'wbthomason/packer.nvim',
            event = "VimEnter"
        }

        use 'machakann/vim-highlightedyank'

        use {
          'tpope/vim-surround'
        }

        use({
          'ggandor/lightspeed.nvim'
        })

        use({
            'weilbith/nvim-code-action-menu',
            cmd = 'CodeActionMenu',
        })

        use {
            'kosayoda/nvim-lightbulb',
            -- config = function()
            --     require "configs.nvim-lightbulb"
            -- end
        }

        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use {
            'hrsh7th/nvim-cmp',
            config = function()
                require "configs.nvim-cmp"
            end
    }


        use "lukas-reineke/indent-blankline.nvim"

        -- Plugins can have dependencies on other plugins
        -- use {
        --   'haorenW1025/completion-nvim',
        --   opt = true,
        --   requires = {{'hrsh-7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
        -- }

        -- use {'shougo/deoplete-lsp'}
        -- use {
        --     'shougo/deoplete.nvim', 
        --     hook = fn['remote#host#UpdateRemotePlugins']
        -- }
        use { 
            "windwp/nvim-autopairs",  -- smarter pairing of strings,parenthesis
            config = function()
                require "configs.autopairs"
            end
        }
        use {
            'mhartington/formatter.nvim',
            config = function()
                require "configs.formatter"
            end
        }
        use {"dstein64/vim-startuptime"}
        use {'tpope/vim-fugitive'}
        use {
            'nvim-treesitter/nvim-treesitter',
            event = "BufRead",
            config = function()
                require "configs.treesitter"
            end
        }
        use {
            'neovim/nvim-lspconfig',
            config = function()
                require "configs.nvim-lspconfig"
            end
        }
        use {
            'williamboman/nvim-lsp-installer',
            config = function()
                require "configs.nvim-lsp-installer"
            end,
            event = "BufRead"
        }
        use {
            'mfussenegger/nvim-lint',
            config = function()
                require "configs.nvim-lint"
            end
        }
        use {
            'junegunn/fzf', 
            hook = fn['fzf#install']
        }
        use {'junegunn/fzf.vim'}
        use {'ojroques/nvim-lspfuzzy'}
        use {
            'akinsho/nvim-bufferline.lua',
            config = function()
                require "configs.top-bufferline"
            end
        }
        use {
            'kyazdani42/nvim-web-devicons',
            config = function()
                require "configs.icons"
            end
        }
        use {
            'kyazdani42/nvim-tree.lua',
            cmd = {"NvimTreeToggle", "NvimTreeFocus"},
            config = function()
                require "configs.nvimTree"
            end
        }
        use {
          'numToStr/Comment.nvim',
          config = function()
            require('Comment').setup()
          end
        }
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
                require "configs.telescope-nvim"
            end,
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"},
                {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope"},
                {"nvim-telescope/telescope-media-files.nvim", cmd = "Telescope"}
            },
        }
        -- use {'theHamsta/nvim-dap-virtual-text'}
        -- use {
        --     'nvim-telescope/telescope-dap.nvim',
        --     config = function()
        --         require "configs.telescope-dap"
        --     end
        -- }
        -- use {'mfussenegger/nvim-dap-python'}
        -- use { 
        --     "rcarriga/nvim-dap-ui",
        --     config = function()
        --         require "configs.dap-ui"
        --     end
        -- }
        -- use {
        --     'mfussenegger/nvim-dap',
        --     config = function()
        --         require "configs.nvim-dap"
        --     end
        -- }

        use {'unblevable/quick-scope'} -- visual cues to enhance f,t motion
        -- use {'folke/lsp-trouble.nvim'} -- nice IDE like error list
        -- use {'tpope/vim-unimpaired'} -- next buffer with ]b
        use {
            'mhinz/vim-startify',
            config = function()
                require "configs.startify"
            end
        }
        use {'wellle/targets.vim'} -- extends ci' to things like (),commas,

        -- extension of % (helps go to opposite end of things like (),{}, even if/else statements)
        use {
            'andymass/vim-matchup',
            event = "CursorMoved"
        } 

        use {'jbyuki/one-small-step-for-vimkind'}
        use {
            "folke/which-key.nvim",
            config = function()
                require "configs.whichkey"
            end
        }
        --
        -- -- snippet support
        use { 
            "hrsh7th/vim-vsnip",
            config = function()
                require "configs.vim-vsnip"
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

        use {'ray-x/lsp_signature.nvim'}
        use {
            "tweekmonster/startuptime.vim",
            cmd = "StartupTime"
        }
        use 'folke/tokyonight.nvim'
        use({
            "aserowy/tmux.nvim",
            config = function()
                require "configs.tmux"
            end
        })

        use {
            'christoomey/vim-tmux-navigator'
        }
    end
)
