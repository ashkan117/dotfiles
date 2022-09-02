local ls = require("luasnip")

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

map("n", "<leader>gf", ":edit <cfile><cr>", opt)

-- Reselect the cursor position when yanking a visual selection
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Keep things centered when going through searches
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

map("v", "p", '"_dP', opt)
-- Don't copy the replaced text after pasting in visual mode
map("v", "p", '"_dP', opt)

-- nvim cmp
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/configs/_luasnip.lua<CR>")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using :map
map("", "j", 'v:count ? "j" : "gj"', { expr = true })
map("", "k", 'v:count ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count ? "k" : "gk"', { expr = true })

-- OPEN TERMINALS --
map("n", "<C-l>", ":vnew +terminal | setlocal nobuflisted <CR>", opt) -- term over right
map("n", "<C-x>", ":10new +terminal | setlocal nobuflisted <CR>", opt) --  term bottom
map("n", "<C-t>t", ":<Cmd> terminal <CR>", opt) -- term buffer

-- copy whole file content
map("n", "<C-a>", ":%y+<CR>", opt)

-- toggle numbers
map("n", "<leader>n", ":set nu!<CR>", opt)
map("n", "<leader><leader>", "<C-^>", opt)

-- nvimtree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)

-- dashboard stuff
-- map("n", "<Leader>db", ":Dashboard<CR>", opt)
-- map("n", "<Leader>fn", ":DashboardNewFile<CR>", opt)
-- map("n", "<Leader>bm", ":DashboardJumpMarks<CR>", opt)
-- map("n", "<C-s>l", ":SessionLoad<CR>", opt)
-- map("n", "<C-s>s", ":SessionSave<CR>", opt)

-- more sane mapping for moving to start and end of line
-- similar to how C and D work
map("n", "H", "0", opt)
map("n", "L", "$", opt)

-- Telescope
map("n", "<Leader>gt", ":Telescope git_status <CR>", opt)
map("n", "<Leader>cm", ":Telescope git_commits <CR>", opt)
map("n", "<Leader>ff", ":Telescope find_files <CR>", opt)
map("n", "<Leader>fg", ":Telescope live_grep <CR>", opt)
map("n", "<Leader>fp", ":Telescope media_files <CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)
map("n", "<Leader>fo", ":Telescope oldfiles<CR>", opt)

-- bufferline tab stuff
-- map("n", "<S-t>", ":enw<CR>", opt) -- new buffer
-- map("n", "<C-t>b", ":tabnew<CR>", opt) -- new tab
-- map("n", "<S-x>", ":bd!<CR>", opt) -- close tab

-- move between tabs
-- map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
-- map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opt)

-- use ESC to turn off search highlighting
map("n", "<Esc>", ":noh<CR>", opt)

map("i", "jk", "<esc>", opt)

-- get out of terminal with jk
map("t", "jk", "<C-\\><C-n>", opt)

-- Packer commands till because we are not loading it at startup
vim.cmd("silent! command PackerCompile lua require 'pluginList' require('packer').compile()")
vim.cmd("silent! command PackerInstall lua require 'pluginList' require('packer').install()")
vim.cmd("silent! command PackerStatus lua require 'pluginList' require('packer').status()")
vim.cmd("silent! command PackerSync lua require 'pluginList' require('packer').sync()")
vim.cmd("silent! command PackerUpdate lua require 'pluginList' require('packer').update()")

-- Vim Fugitive
-- map("n", "<Leader>gs", ":Git<CR>", opt)
-- map("n", "<Leader>gh", ":diffget //2<CR>", opt)
-- map("n", "<Leader>gl", ":diffget //3<CR>", opt)
-- map("n", "<Leader>gb", ":Git blame<CR>", opt)

-- tmux
-- map("n", "<C-h>", "[[<cmd>lua require("tmux").move_left()<cr>]]", opt)
-- map("n", "<C-l>", "[[<cmd>lua require("tmux").move_right()<cr>]]", opt)
-- map("n", "<C-j>", "[[<cmd>lua require("tmux").move_bottom()<cr>]]", opt)
-- map("n", "<C-k>", "[[<cmd>lua require("tmux").move_top()<cr>]]", opt)
--
--
--
-- map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {silent= true})
-- map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
-- map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
-- map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
-- map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- map("n", "<space-xx>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- map("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {silent = true})
-- map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
-- map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
-- map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
-- map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

-- Page up and down with Shift + j and Shift + k
-- vim.keymap.set("n", "J", "<PageDown>", {})
-- vim.keymap.set("n", "K", "<PageUp>", {})

-- vim.keymap.set("n", "ei", ":e ~/.config/nvim/init.lua<cr>", {})
vim.keymap.set("n", "ri", ":luafile ~/.config/nvim/init.lua<cr>", {})

--
-- trouble diagnostics
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
  action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
  action.smart_scroll_with_saga(-1)
end, { silent = true })
vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
-- close rename win use <C-c> in insert mode or `q` in normal mode or `:q`
-- vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
