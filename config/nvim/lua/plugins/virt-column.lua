local icons = require "icons"

return {
  {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = icons.virt_line,
    },
  },
}
