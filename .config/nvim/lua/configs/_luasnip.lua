local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
ls.config.setup({
  history = true,
  updateevents = "TextChanged, TextChangedI",
})

ls.add_snippets("all", {
  s("cl", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    t('console.log("'),
    i(1, ""),
    t('")'),
  }),
  s("deb", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    t('logger.debug("'),
    i(1, ""),
    t('")'),
  }),
})
