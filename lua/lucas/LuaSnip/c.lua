local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  -- Formatting
  s({trig=";xy"},
    fmta(
      [[
        #include <>

        int main(void)
        {
          <>

          return 0;
        }
      ]],
    { i(1), i(2) }
    )
  ),
}
