return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",
        -- optional
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
      {
        arg = "leetcode.nvim",
        lang = "golang",
        cn = { -- leetcode.cn
            enabled = false,
            translator = true,
            translate_problems = true,
        },
        storage = {
            home = vim.fn.stdpath("data") .. "/leetcode",
            cache = vim.fn.stdpath("cache") .. "/leetcode",
        },
        plugins = {
            non_standalone = false,
        },
        logging = true,
        injector = {
          ["python3"] = {
            before = true
          },
        },
        cache = {
            update_interval = 60 * 60 * 24 * 7,
        },
        console = {
            open_on_runcode = true,
            dir = "row",
            size = {
                width = "90%",
                height = "75%",
            },
            result = {
                size = "60%",
            },
            testcase = {
                virt_text = true,
                size = "40%",
            },
        },
        description = {
            position = "left",
            width = "40%",
            show_stats = true,
        },
        hooks = {
            ["enter"] = {},
            ["question_enter"] = {},
            ["leave"] = {},
        },
        keys = {
            toggle = { "q", "<Esc>" },
            confirm = { "<CR>" },
            reset_testcases = "r",
            use_testcase = "U",
            focus_testcases = "H",
            focus_result = "L",
        },
        theme = {
          ["alt"] = {
            bg = "#777777",
          },
          ["normal"] = {
            fg = "#545454",
          },
        },
        image_support = false,
      }
    },
  }
}
