local g = vim.g -- a table to access global variables
local modules = {
	"options",
	"autocmds",
	"mappings",
	"utils",
}

for i = 1, #modules, 1 do
	pcall(require, modules[i])
end


-------------------- PLUGINS -------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn

require('lazy').setup(
{
"machakann/vim-highlightedyank",
"tpope/vim-surround",
"bkad/CamelCaseMotion",
'mbbill/undotree',
"tpope/vim-repeat",
{
"weilbith/nvim-code-action-menu",
cmd = "CodeActionMenu",
},
"kosayoda/nvim-lightbulb",
{
"L3MON4D3/LuaSnip",
config = function()
require("lua/plugins/._luasnip")
end,
},
"hrsh7th/cmp-buffer",
"hrsh7th/cmp-path",
"hrsh7th/cmp-cmdline",
"hrsh7th/cmp-nvim-lsp",
"hrsh7th/cmp-nvim-lua",
"saadparwaiz1/cmp_luasnip",
"onsails/lspkind-nvim",
{
"hrsh7th/nvim-cmp",
config = function()
require("lua/plugins/._nvim-cmp")
end,
},
"lukas-reineke/indent-blankline.nvim",
-- {
--   "windwp/nvim-autopairs", -- smarter pairing of strings,parenthesis
--   config = function(,
--     require("lua/plugins/._nvim-autopairs",
--   end,
-- },
"dstein64/vim-startuptime",
"tpope/vim-fugitive",
{
"nvim-treesitter/nvim-treesitter",
event = "BufRead",
config = function()
require("lua/plugins/._nvim-treesitter")
end,
},
{
"neovim/nvim-lspconfig",
config = function()
require("lua/plugins/._nvim-lspconfig")
end,
},
{
"jose-elias-alvarez/null-ls.nvim",
config = function()
require("lua/plugins/._null-ls")
end,
},
{
			"junegunn/fzf",
			hook = fn["fzf#install"],
		},
		"junegunn/fzf.vim",
		"ojroques/nvim-lspfuzzy",
		{
			"akinsho/nvim-bufferline.lua",
			config = function()
				require("lua/plugins/._top-bufferline")
			end,
		},
		-- {
		-- 	"kyazdani42/nvim-web-devicons",
		-- 	config = function()
		-- 		require("lua/plugins/._nvim-web-devicons")
		-- 	end,
		-- },
		-- {
		--   "kyazdani42/nvim-tree.lua",
		--   cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		--   config = function()
		--     require("lua/plugins/._nvim-tree")
		--   end,
		-- },
		{
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		},
		{
			"nvim-lua/plenary.nvim",
			dependencies = {
				"nvim-lua/popup.nvim",
			}
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-media-files.nvim",
		{
			"nvim-telescope/telescope.nvim",
			config = function()
				require("lua/plugins/._telescope")
			end,
			dependencies = {
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
			},
		},
		"unblevable/quick-scope", -- visual cues to enhance f,t motion
		-- -- Lua
		{
			"folke/trouble.nvim",
			dependencies = "nvim-tree/nvim-web-devicons",
			config = function()
				-- require("trouble").setup({
				--   -- your configuration comes here
				--   -- or leave it empty to he default settings
				--   -- refer to the configuration section below
				-- },
			end,
		},
		-- {
		--   "mhinz/vim-startify",
		--   config = function(,
		--     require("lua/plugins/._startify",
		--   end,
		-- },
		"wellle/targets.vim", -- extends ci' to things like (),commas,
		-- extension of % (helps go to opposite end of things like (),{}, even if/else statements)
		{
			"andymass/vim-matchup",
			event = "CursorMoved",
		},
		"jbyuki/one-small-step-for-vimkind",
		{
			"folke/which-key.nvim",
			config = function()
				require("lua/plugins/._which-key")
			end,
		},
		--
		--
		-- -- JS
		"pangloss/vim-javascript",
		"leafgarland/typescript-vim",
		--
		-- -- JSX
		"MaxMEllon/vim-jsx-pretty",
		"peitalin/vim-jsx-typescript",
		--

		"ray-x/lsp_signature.nvim",
		{
			"tweekmonster/startuptime.vim",
			cmd = "StartupTime",
		},
		"folke/tokyonight.nvim",
		{
			"aserowy/tmux.nvim",
			config = function()
				require("lua/plugins/._tmux")
			end,
		},

		"christoomey/vim-tmux-navigator",
		"mfussenegger/nvim-jdtls",
		{
			"otavioschwanck/cool-substitute.nvim",
			config = function()
				require 'cool-substitute'.setup({
					setup_keybindings = true
				})
			end,
		},
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		},
		{
			"glepnir/lspsaga.nvim",
			branch = "main",
			config = function()
				require("lspsaga").setup({})
			end,
			dependencies = { { "nvim-tree/nvim-web-devicons" } }
		},
		-- {
		-- 	-- "nvim-neo-tree/neo-tree.nvim",
		-- 	"~/projects/neo-tree.nvim",
		-- 	branch = "v2.x",
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",
		-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		-- 		"MunifTanjim/nui.nvim",
		-- 	}
		-- },
		"ellisonleao/gruvbox.nvim",
		-- 's1n7ax/nvim-window-picker',
		--   tag = 'v1.*',
		--   config = function(,
		--     require 'window-picker'.setup()
		--   end,
		-- }
		{
			'edluffy/hologram.nvim',
			config = function()
				require('hologram').setup {
					auto_display = true -- WIP automatic markdown image display, may be prone to breaking
				}
			end,
		},
		-- {
		--   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		--   config = function(,
		--     require("lsp_lines").setup()
		--   end,
		-- },

	}
)
