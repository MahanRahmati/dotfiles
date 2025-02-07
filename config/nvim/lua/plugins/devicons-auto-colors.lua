return {
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = function()
      local theme_colors = require("catppuccin.palettes").get_palette "mocha"
      return {
        colors = theme_colors,
      }
    end,
  },
}
