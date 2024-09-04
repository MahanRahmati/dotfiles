return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local icons = require "icons"
      return {
        shortcut_type = "number",
        config = {
          header = {
            [[]],
            [[]],
            [[                                                     ██                   ]],
            [[        ████  █████                              ██                   ]],
            [[       ███████████                                                      ]],
            [[      ████████████████████████████    ███████████████████████ ]],
            [[     ███████████████   ██████████  ███████████████████████  ]],
            [[    ████████████████████████ ████████████████████████   ]],
            [[   █████████████       ███ █████████████████████████    ]],
            [[  █████  █████████████ █████████ ████████████████████     ]],
            [[]],
            [[]],
          },
          disable_move = true,
          shortcut = {
            {
              desc = icons.file .. " New File ",
              group = "@property",
              action = [[ene | startinser]],
              key = "n",
            },
            {
              desc = icons.find .. " Find File ",
              group = "@property",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = icons.folder .. " Recent Projects ",
              group = "@property",
              action = "Telescope projects",
              key = "r",
            },
            {
              desc = icons.configuration .. " Configuration ",
              group = "@property",
              action = "e ~/.config/nvim/init.lua",
              key = "c",
            },
            {
              desc = icons.lazy .. " Package Manager ",
              group = "@property",
              action = "Lazy",
              key = "p",
            },
            {
              desc = icons.quit .. " Quit ",
              group = "@property",
              action = "qa",
              key = "q",
            },
          },
          packages = {
            enable = true,
          },
          project = {
            enable = false,
          },
          mru = {
            limit = 9,
            label = " Recent Files",
          },
          footer = {},
        },
        hide = {
          statusline = true,
        },
      }
    end,
  },
}
