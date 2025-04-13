return {
  {
    "catppuccin/nvim",
    priority = 1000,
    opts = function()
      local colors = require "colors"

      local function get_theme()
        if vim.g.theme_mode == "dark" then
          return "mocha"
        elseif vim.g.theme_mode == "light" then
          return "latte"
        end
      end

      return {
        flavour = get_theme(),
        transparent_background = true,
        no_underline = true,
        color_overrides = {
          mocha = {
            base = colors.background, -- Default bg
            mantle = colors.background, -- Darker bg
            crust = "#585B70", -- Darkest bg
          },
        },
        custom_highlights = function(c)
          return {
            Pmenu = { bg = c.base },
            WhichKey = { fg = c.blue },
            WhichKeyGroup = { fg = c.green },
            WhichKeyDesc = { fg = c.mauve },
            LineNr = { fg = c.surface2 },
            CursorLineNr = { fg = c.yellow },
            FloatBorder = { fg = c.yellow },
            DashboardHeader = { fg = c.green },
            NeoTreeFloatTitle = { fg = c.yellow },
            NeoTreeDirectoryName = { fg = c.green, style = { "bold" } },
            NeoTreeDirectoryIcon = { fg = c.green },
          }
        end,
        integrations = {
          cmp = true,
          blink_cmp = true,
          dashboard = true,
          fidget = true,
          gitsigns = true,
          illuminate = true,
          mason = true,
          neotree = true,
          notify = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      }
    end,
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
