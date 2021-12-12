
-- g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
-- g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
vim.g.startify_bookmarks = { 
    {i = '~/.config/nvim/init.lua'}, 
    {t = '~/.config/nvim/lua/plugins/telescope-nvim.lua'}, 
    {p = '~/.config/nvim/lua/pluginList.lua'},
    {m = '~/.config/nvim/lua/mappings.lua'}
}  -- enable deoplete at startup


-- g['qs_highlight_on_keys'] = {'f', 'F', 't', 'T'} -- trigger a highlight when pressing these keys:
-- vim.g.startify_lists = {{ type = ‘sessions’, header = {‘ Sessions’} }, { type = ‘files’, header = {‘ Files’} }, { type = ‘dir’, header = {‘ Files ‘ .. fn.getcwd()} }, { type = ‘bookmarks’, header = {‘ Bookmarks’} }, { type = ‘commands’, header = {‘ Commands’} }}
