local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet

return {
    s({ trig = ";n", snippetType = "autosnippet"},
        {
            t("'\\n'")
        }),
    s({ trig = ";st", snippetType = "autosnippet"},
        {
            t("std::")
        }),
}
