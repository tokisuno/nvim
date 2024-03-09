local ls = require("luasnip") 
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local extras = require("luasnip.extras")
local rep = extras.rep
return {
  -- Formatting
  s({trig=";glos"},
    fmta(
      [[
        \ex\label{<>}
          \gll{<>}\\
          {<>}\\ 
          \trans``<>''
      ]],
    { i(1), i(2), i(3), i(4) }
    )
  ),
  s({trig=";sta"},
    fmta(
      [[
          \begin{<>}
              
          \end{<>}
      ]],
      { i(1), rep(1) }
    )
  ),
  s({trig=";sec", dscr="creates section", snippetType="autosnippet"},
    fmta(
      [[
          \section{<>}
      ]],
      { i(1) }
    )
  ),
  s({trig=";f", snippetType="autosnippet"},
    fmta(
      [[
          ``<>''
      ]],
      { i(1) }
    )
  ),
  -- Text Weighting
  s({trig=";tt", snippetType="autosnippet"},
    fmta(
      "\\texttt{<>}",
      { i(1) }
    )
  ),
  s({trig=";tit", snippetType="autosnippet"},
    fmta(
      "\\textit{<>}",
      { i(1) }
    )
  ),
  s({trig=";tbf", snippetType="autosnippet"},
    fmta(
      "\\textbf{<>}",
      { i(1) }
    )
  ),
  s({trig=";tsc", snippetType="autosnippet"},
    fmta(
      "\\textsc{<>}",
      { i(1) }
    )
  ),
}
