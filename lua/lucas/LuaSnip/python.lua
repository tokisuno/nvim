local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta


return {
  s({trig=";xy"},
    t(
      [[
        def main():


        if __name__ == "__main__":
            main()
      ]],
      {}
    )
  ),
}
