vim.pack.add { "https://github.com/nvimdev/dashboard-nvim" }

local icons = require "icons"

require("dashboard").setup {
  shortcut_type = "number",
  config = {
    header = {
      [[]],
      [[]],
      [[                                                                            ]],
      [[        ████  █████                              ███                  ]],
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
        action = vim.pack.update,
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
      enable = false,
    },
    project = {
      enable = false,
    },
    mru = {
      limit = 5,
      label = " Recent Files",
    },
    footer = {},
  },
  hide = {
    statusline = true,
  },
}
