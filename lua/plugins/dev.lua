return {
  -- {
  --   dir = "~/code/lua/plugins/vling",
  --   name = "vling",
  --   dependencies = "tjdevries/stackmap.nvim",
  --   config = function ()
  --     require("vling")
  --   end
  -- },

  {
    "tokisuno/vling",
    dependencies = "tjdevries/stackmap.nvim",
    config = function ()
      require("vling")
    end
  }
}

