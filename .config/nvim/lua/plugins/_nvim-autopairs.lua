local present1, autopairs = pcall(require, "nvim-autopairs")

if not present1 then
  return
end

autopairs.setup()
-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
-- autopairs_completion.setup(
--     {
--         map_cr = true,
--         map_complete = true -- insert () func completion
--     }
-- )
