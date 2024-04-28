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
            [[    _   __                    _          ]],
            [[   / | / /___   ____  _   __ (_)____ ___ ]],
            [[  /  |/ // _ \ / __ \| | / // // __ `__ \]],
            [[ / /|  //  __// /_/ /| |/ // // / / / / /]],
            [[/_/ |_/ \___/ \____/ |___//_//_/ /_/ /_/ ]],
            [[                                         ]],
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
              desc = icons.lazy .. " Lazy ",
              group = "@property",
              action = "Lazy",
              key = "l",
            },
            {
              desc = icons.quit .. " Quit ",
              group = "@property",
              action = "qa",
              key = "q",
            },
          },
          packages = {
            enable = false,
          },
          project = {
            enable = false,
          },
          mru = {
            limit = 10,
            label = " Recent Files",
          },
          footer = {},
        },
        hide = {
          statusline = false,
        },
      }
    end,
  },
}
