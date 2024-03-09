return {
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<Esc>",
        "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>",
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      background_colour = "#000000",
      render = "wrapped-compact",
      max_width = 80,
    },
    init = function()
      vim.notify = require "notify"

      print = function(...)
        local print_safe_args = {}
        local _ = { ... }
        for i = 1, #_ do
          table.insert(print_safe_args, tostring(_[i]))
        end
        vim.notify(table.concat(print_safe_args, " "), "info")
      end
    end,
  },
}
