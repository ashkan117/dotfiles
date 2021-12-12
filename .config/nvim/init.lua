local g = vim.g      -- a table to access global variables
local modules = {
    "options",
    "autocmds",
    "mappings",
    "utils",
    "pluginList"
}

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end

