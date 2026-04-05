vim.pack.add { "https://github.com/rcarriga/nvim-notify" }

local icons = require "icons"

require("notify").setup {
  background_colour = "#080808",
  icons = {
    DEBUG = icons.debug,
    ERROR = icons.error,
    INFO = icons.info,
    TRACE = icons.trace,
    WARN = icons.warn,
  },
  render = "wrapped-compact",
  max_width = 42,
  timeout = 3000,
  top_down = true,
}

vim.notify = require "notify"

vim.keymap.set(
  "n",
  "<Esc>",
  "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>",
  { desc = "Dismiss Notifications" }
)
