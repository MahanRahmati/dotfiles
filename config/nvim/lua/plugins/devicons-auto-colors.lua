return {
  {
    "rachartier/tiny-devicons-auto-colors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local function get_theme()
        if vim.g.theme_mode == "dark" then
          return "mocha"
        elseif vim.g.theme_mode == "light" then
          return "latte"
        end
      end

      local theme = get_theme()
      local theme_colors = require("catppuccin.palettes").get_palette(theme)
      return {
        colors = theme_colors,
      }
    end,
  },
}
