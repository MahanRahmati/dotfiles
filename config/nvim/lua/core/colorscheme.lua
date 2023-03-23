local status_ok, colorscheme = pcall(require, "catppuccin")
if not status_ok then
  vim.notify("Failed to load colorscheme", "error")
  return
end

colorscheme.setup {
  flavour = "mocha",
  color_overrides = {
    mocha = {
      -- rosewater = "#F5E0DC", -- Winbar
      -- flamingo = "#F2CDCD", -- Target word
      -- pink = "#F5C2E7", -- Just pink
      -- mauve = "#CBA6F7", -- Tag
      -- red = "#F38BA8", -- Error
      -- maroon = "#EBA0AC", -- Lighter red
      -- peach = "#FAB387", -- Number
      -- yellow = "#F9E2AF", -- Warning
      -- green = "#A6E3A1", -- Diff add
      -- teal = "#94E2D5", -- Hint
      -- sky = "#89DCEB", -- Operator
      -- sapphire = "#74C7EC", -- Constructor
      -- blue = "#89B4FA", -- Diff changed
      -- lavender = "#B4BEFE", -- CursorLine Nr
      -- text = "#CDD6F4", -- Default fg
      -- subtext1 = "#BAC2DE", -- Indicator
      -- subtext0 = "#A6ADC8", -- Float title
      -- overlay2 = "#9399B2", -- Popup fg
      -- overlay1 = "#7F849C", -- Conceal color
      -- overlay0 = "#6C7086", -- Fold color
      -- surface2 = "#585B70", -- Default comment
      -- surface1 = "#45475A", -- Darker comment
      -- surface0 = "#313244", -- Darkest comment
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

vim.cmd.colorscheme "catppuccin"
