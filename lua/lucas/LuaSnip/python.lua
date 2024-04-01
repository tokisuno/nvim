local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta


return {
  s({trig=";xy"},
    fmta(
      [[
        def main():
            <>


        if __name__ == "__main__":
            main()
      ]],
    { i(1) }
    )
  ),
}
