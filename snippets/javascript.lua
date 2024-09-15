local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require('luasnip.extras')
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt
local c = ls.choice_node
local f = ls.function_node

ls.add_snippets('javascript', {
  s("clt", fmt(
    [[
    console.log(`{}`);
    ]],
    {
      i(1)
    })
  ),
  s("cls", fmt(
    [[
    console.log('{}');
    ]],
    {
      i(1)
    })
  ),
  s("cld", fmt(
    [[
    console.log("{}");
    ]],
    {
      i(1)
    })
  ),
})
