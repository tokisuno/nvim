local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local s = ls.snippet

local extras = require("luasnip.extras")
local fmta = require("luasnip.extras.fmt").fmta
local p = extras.partial


return {
  s({trig=";tit"},
    fmta(
      [[
        ---
        title: <>
        author: tokisuno
        date: <>
        ---
      ]],
    { i(1), p(os.date, '%Y-%m-%d') }
    )
  ),
  s({trig=";dt"},
    fmta(
      [[
      <>
      ]],
    { t(vim.fn.system([[date +"%Y-%m-%d" | tr -d '\n']])) }
    )
  ),
  s({trig=";go"},
    fmta(
      [[
        ```go
        <>
        ```
      ]],
    { i(1) }
    )
  ),
  s({trig=";py"},
    fmta(
      [[
        ```python
        <>
        ```
      ]],
    { i(1) }
    )
  ),
  s({trig=";h1"},
    fmta(
      [[
        # <>
      ]],
    { i(1) }
    )
  ),
  s({trig=";h2"},
    fmta(
      [[
        ## <>
      ]],
    { i(1) }
    )
  ),
  s({trig=";h3"},
    fmta(
      [[
        ### <>
      ]],
    { i(1) }
    )
  ),
}
