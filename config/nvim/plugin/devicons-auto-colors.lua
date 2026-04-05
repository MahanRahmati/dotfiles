vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    vim.pack.add {
      "https://github.com/rachartier/tiny-devicons-auto-colors.nvim",
    }
    local function get_theme()
      if vim.opt.background == "dark" then
        return "mocha"
      elseif vim.opt.background == "light" then
        return "latte"
      end
    end

    local theme = get_theme()
    local theme_colors = require("catppuccin.palettes").get_palette(theme)

    require("tiny-devicons-auto-colors").setup {
      colors = theme_colors,
    }
  end,
})
