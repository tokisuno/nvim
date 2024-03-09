return {
  {'L3MON4D3/LuaSnip',
    init = function()
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
        update_events = 'TextChanged,TextChangedI'
      })
    end
  }
}
