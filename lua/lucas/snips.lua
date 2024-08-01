local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require('luasnip.extras')
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt
local c = ls.choice_node
local f = ls.function_node

ls.add_snippets('lua', {
  s("pri", {
    t("print('"),
    i(1),
    t("')")
  })
})

ls.add_snippets('c', {
  s("#N", fmt(
    [[ 
      #include <stdio.h>

      int main(void)
      {{
        {}
        return 0;
      }}
    ]],
    {
      i(1)
    },
    {
      delimiters = "{}"
    })
  ),
})
