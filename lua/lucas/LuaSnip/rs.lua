local ls = require("luasnip")
local i = ls.insert_node
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta

return {
  s({trig=";d", snippetType = "autosnippet"},
    fmta(
      [["<>"]],
    { i(1) }
    )
  ),
  s({trig=";s", snippetType = "autosnippet"},
    fmta(
      [['<>']],
    { i(1) }
    )
  ),
}
