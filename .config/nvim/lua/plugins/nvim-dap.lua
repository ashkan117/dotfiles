local dap = require"dap"
dap.configurations.lua = { { 
    type = 'nlua', 
    request = 'attach',
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input('Host [127.0.0.1]: ')
      if value ~= "" then
        return value
      end
      return '127.0.0.1' end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, "Please provide a port number")
      return val
    end,
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end


-- dap.adapters.python = {
--   type = 'executable';
--   command = 'python3';
--   args = { '-m', 'debugpy.adapter' };
-- }

-- dap.configurations.python = {
--   {
--     -- The first three options are required by nvim-dap
--     type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
--     request = 'launch';
--     name = "Launch file";

--     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

--     program = "${file}"; -- This configuration will launch the current file if used.
--     pythonPath = '/usr/bin/python3';
--     -- pythonPath = function()
--     --   -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
--     --   -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
--     --   -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
--     --   local cwd = vim.fn.getcwd()
--     --   if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
--     --     return cwd .. '/venv/bin/python'
--     --   elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
--     --     return cwd .. '/.venv/bin/python'
--     --   else
--     --     return '/usr/bin/python'
--     --   end
--     -- end;
--   },
-- }
--
--
--
--
--
--
--
--
--

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>') 
map('n', '<leader>ds', '<cmd>lua require"dap".step_over()<CR>') 
map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>') 
map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>') 
map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>') 
-- map('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>') 
-- map('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>') 
map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>') 
map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>') 
map('n', '<leader>dh', '<cmd>lua require"dap.ui.widgets".hover()<CR>') 
-- dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

_G.open_sidebar = function()
    local widgets = require('dap.ui.widgets')
    local my_sidebar = widgets.sidebar(widgets.scopes)
    my_sidebar.open()
end

-- vim.api.nvim_set_keymap("n","<leader>dp", "v:lua.open_sidebar()", {expr = true})
vim.api.nvim_set_keymap("n","<leader>dp", "<cmd>lua open_sidebar()<CR>", {})
-- vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", {expr = true})

