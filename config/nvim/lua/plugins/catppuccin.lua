return {
  {
    "catppuccin/nvim",
    priority = 1000,
    opts = function()
      local colors = require "colors"
      return {
        flavour = "mocha",
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
            TreesitterContext = { bg = "#242633" },
            TreesitterContextLineNumber = { fg = c.surface2 },
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
          gitsigns = true,
          illuminate = true,
          mason = true,
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
