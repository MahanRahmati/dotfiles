return {
  {
    "catppuccin/nvim",
    priority = 1000,
    opts = {
      flavour = "mocha",
      -- transparent_background = false,
      no_underline = true,
      color_overrides = {
        mocha = {
          -- Winbar
          -- rosewater = "#F5E0DC",
          -- Target word
          -- flamingo = "#F2CDCD",
          -- Just pink
          -- pink = "#F5C2E7",
          -- Tag
          -- mauve = "#CBA6F7",
          -- Error
          -- red = "#F38BA8",
          -- Lighter red
          -- maroon = "#EBA0AC",
          -- Number
          -- peach = "#FAB387",
          -- Warning
          -- yellow = "#F9E2AF",
          -- Diff add
          -- green = "#A6E3A1",
          -- Hint
          -- teal = "#94E2D5",
          -- Operator
          -- sky = "#89DCEB",
          -- Constructor
          -- sapphire = "#74C7EC",
          -- Diff changed
          -- blue = "#89B4FA",
          -- CursorLine Nr
          -- lavender = "#B4BEFE",
          -- Default fg
          -- text = "#CDD6F4",
          -- Indicator
          -- subtext1 = "#BAC2DE",
          -- Float title
          -- subtext0 = "#A6ADC8",
          -- Popup fg
          -- overlay2 = "#9399B2",
          -- Conceal color
          -- overlay1 = "#7F849C",
          -- Fold color
          -- overlay0 = "#6C7086",
          -- Default comment
          -- surface2 = "#585B70",
          -- Darker comment
          -- surface1 = "#45475A",
          -- Darkest comment
          -- surface0 = "#313244",
          base = "#0E1116", -- Default bg
          mantle = "#0E1116", -- Darker bg
          crust = "#585B70", -- Darkest bg
        },
      },
      custom_highlights = function(colors)
        return {
          Pmenu = { bg = colors.base },
          WhichKey = { fg = colors.blue },
          WhichKeyGroup = { fg = colors.green },
          WhichKeyDesc = { fg = colors.mauve },
          TreesitterContext = { bg = "#242633" },
          TreesitterContextLineNumber = { fg = colors.surface2 },
          LineNr = { fg = colors.surface2 },
          CursorLineNr = { fg = colors.yellow },
          SmoothCursor = { fg = colors.yellow },
          NavicText = { fg = colors.text },
          NavicSeparator = { fg = colors.surface2 },
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
        navic = {
          enabled = true,
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
