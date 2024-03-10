local icons = require "icons"

return {
  {
    "lukas-reineke/virt-column.nvim",
    event = "VimEnter",
    opts = {
      char = icons.virt_line,
    },
  },
}
