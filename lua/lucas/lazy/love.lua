return {
  {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    opts = {
      path_to_love_bin = "/bin/love",
      path_to_love_library = "/usr/lib/liblove.so",
    },
    keys = {
      { "<leader>v", ft = "lua", desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
    },
  }
}
