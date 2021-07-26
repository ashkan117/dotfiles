local g = vim.g      -- a table to access global variables
local chad_modules = {
    "options",
    "mappings",
    "utils",
    "pluginList"
}

for i = 1, #chad_modules, 1 do
    pcall(require, chad_modules[i])
end

