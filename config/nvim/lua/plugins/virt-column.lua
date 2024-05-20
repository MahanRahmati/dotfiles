return {
  {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      local icons = require "icons"
      return {
        char = icons.virt_line,
        highlight = "ErrorMsg",
      }
    end,
  },
}
