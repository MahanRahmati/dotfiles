local icons = require "icons"

return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    opts = {
      signs = {
        add = { text = icons.gitsigns.add },
        change = { text = icons.gitsigns.change },
        delete = { text = icons.gitsigns.delete },
        topdelete = { text = icons.gitsigns.topdelete },
        changedelete = { text = icons.gitsigns.changedelete },
        untracked = { text = icons.gitsigns.untracked },
      },
      current_line_blame = true,
    },
  },
}
