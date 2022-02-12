local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

-- ts_config.setup {
--     ensure_installed = {
--         "bash",
--         "lua"
--     },
--     highlight = {
--         enable = true,
--         use_languagetree = true
--     }
-- }

-- local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "cpp",
        "rust",
        "lua"
    },
    -- indent = {
    --     enable = true
    -- },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
