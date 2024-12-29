return {
  {
    "rcarriga/nvim-notify",
    opts = function()
      local colors = require "colors"
      local icons = require "icons"
      return {
        background_colour = colors.background,
        icons = {
          DEBUG = icons.debug,
          ERROR = icons.error,
          INFO = icons.info,
          TRACE = icons.trace,
          WARN = icons.warn,
        },
        render = "wrapped-default",
        max_width = 42,
        timeout = 3000,
        top_down = false,
      }
    end,
    init = function()
      vim.notify = require "notify"
    end,
    keys = {
      {
        "<Esc>",
        "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>",
        desc = "Dismiss Notifications",
      },
    },
  },
}
