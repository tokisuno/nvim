local ls = require("luasnip")
local extras = require("luasnip.extras")
local fmta = require("luasnip.extras.fmt").fmta

local i = ls.insert_node
local s = ls.snippet
local p = extras.partial

return {
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
  s({trig=";fm"},
    fmta(
      [[
        ---
        title: <>
        author: <>
        date: <>
        ---
      ]],
    { i(1),
      i(2, "Lucas"),
      p(os.date, '%YYYY-%mm-%dd')
    }
    )
  ),
}
