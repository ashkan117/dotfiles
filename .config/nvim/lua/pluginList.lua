-------------------- PLUGINS -------------------------------
local present, _ = pcall(require, "packerInit")
local packer

if present then
  packer = require("packer")
else
  return false
end

local use = packer.use

local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn

return packer.startup(function()
  -- use {
  --     'machakann/vim-highlightedyank'
  -- }

  -- Packer can manage itself
  use({
    "wbthomason/packer.nvim",
    event = "VimEnter",
  })

  use("machakann/vim-highlightedyank")

  use({
    "tpope/vim-surround",
  })

  use({ 'mbbill/undotree' })

  use({
    "tpope/vim-repeat",
  })

  use({
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  })

  use({
    "kosayoda/nvim-lightbulb",
  })
  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("configs._luasnip")
    end,
  })
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use({ "saadparwaiz1/cmp_luasnip" })
  use("onsails/lspkind-nvim")
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("configs._nvim-cmp")
    end,
  })

  use("lukas-reineke/indent-blankline.nvim")

  -- use {'shougo/deoplete-lsp'}
  -- use {
  --     'shougo/deoplete.nvim',
  --     hook = fn['remote#host#UpdateRemotePlugins']
  -- }
  use({
    "windwp/nvim-autopairs", -- smarter pairing of strings,parenthesis
    config = function()
      require("configs._nvim-autopairs")
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require("configs._nvim-treesitter")
    end,
  })
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("configs._nvim-lspconfig")
    end,
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("configs._null-ls")
    end,
  })
  use({
    "junegunn/fzf",
    hook = fn["fzf#install"],
  })
  use({ "junegunn/fzf.vim" })
  use({ "ojroques/nvim-lspfuzzy" })
  use({
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("configs._top-bufferline")
    end,
  })
  use({
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("configs._nvim-web-devicons")
    end,
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({
    "nvim-lua/popup.nvim",
    after = "plenary.nvim",
  })
  use({
    "nvim-lua/plenary.nvim",
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-telescope/telescope-media-files.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("configs._telescope")
    end,
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  })
  use({ "unblevable/quick-scope" }) -- visual cues to enhance f,t motion
  -- -- Lua
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  -- use {'tpope/vim-unimpaired'} -- next buffer with ]b
  use({
    "mhinz/vim-startify",
    config = function()
      require("configs._startify")
    end,
  })
  use({ "wellle/targets.vim" }) -- extends ci' to things like (),commas,

  -- extension of % (helps go to opposite end of things like (),{}, even if/else statements)
  use({
    "andymass/vim-matchup",
    event = "CursorMoved",
  })

  use({
    "folke/which-key.nvim",
    config = function()
      require("configs._which-key")
    end,
  })
  --
  --
  -- -- JS
  use({ "pangloss/vim-javascript" })
  use({ "leafgarland/typescript-vim" })
  --
  -- -- JSX
  use({ "MaxMEllon/vim-jsx-pretty" })
  use({ "peitalin/vim-jsx-typescript" })
  --

  use({ "ray-x/lsp_signature.nvim" })
  use("folke/tokyonight.nvim")
  use({
    "aserowy/tmux.nvim",
    config = function()
      require("configs._tmux")
    end,
  })

  use({
    "christoomey/vim-tmux-navigator",
  })
  use("mfussenegger/nvim-jdtls")
  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })
  use({
    "nvimdev/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = { { "nvim-tree/nvim-web-devicons" } }
  })
  use {
    -- "nvim-neo-tree/neo-tree.nvim",
    "~/projects/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use { "ellisonleao/gruvbox.nvim" }
  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    config = function()
      require 'window-picker'.setup()
    end,
  }
  use({
    'edluffy/hologram.nvim',
    config = function()
      require('hologram').setup {
        auto_display = true -- WIP automatic markdown image display, may be prone to breaking
      }
    end,
  })
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })
  use 'olacin/telescope-cc.nvim'
  use 'dstein64/vim-startuptime'
  use 'barrett-ruth/telescope-http.nvim'
  use("smilovanovic/telescope-search-dir-picker.nvim")
  use("tpope/vim-projectionist")
  use {
    "lewis6991/gitsigns.nvim",
    -- Calling setup is optional.
    config = function()
      require('gitsigns').setup()
    end,

  }
  use {
    "NeogitOrg/neogit",
    config = function()
      local neogit = require('neogit')
      neogit.setup {}
    end,
  }
  use { 'jake-stewart/normon.nvim', config = function()
    local normon = require("normon")
    -- cgn on current word/selection
    normon("<leader>n", "cgn")
    normon("<leader>N", "cgN")
  end

  }
  -- use { 'jake-stewart/recursive-macro.nvim',
  --   config = function()
  --     require("recursive-macros").setup()
  --   end
  -- }
end)
