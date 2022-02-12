local present1, autopairs = pcall(require, "nvim-autopairs")

if not (present1) then
    return
end

autopairs.setup()
-- autopairs_completion.setup(
--     {
--         map_cr = true,
--         map_complete = true -- insert () func completion
--     }
-- )
