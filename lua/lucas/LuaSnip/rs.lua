local ls = require("luasnip")
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node
local s = ls.snippet

local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local p = extras.partial


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
