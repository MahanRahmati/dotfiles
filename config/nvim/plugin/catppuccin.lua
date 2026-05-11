vim.pack.add {
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
}

require("catppuccin").setup {
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  float = {
    transparent = true,
  },
  no_underline = true,
  color_overrides = {
    mocha = {
      base = "#080808", -- Default bg
      mantle = "#080808", -- Darker bg
      crust = "#585B70", -- Darkest bg
    },
  },
  custom_highlights = function(c)
    return {
      Pmenu = { bg = c.base },
      LineNr = { fg = c.surface2 },
      CursorLineNr = { fg = c.yellow, style = { "bold" } },
      FloatBorder = { fg = c.yellow },
      MiniStarterHeader = { fg = c.green },
      NeoTreeFloatTitle = { fg = c.yellow },
      NeoTreeDirectoryName = { fg = c.green, style = { "bold" } },
      NeoTreeDirectoryIcon = { fg = c.green },
      llama_hl_fim_hint = { link = "NonText" },
      llama_hl_fim_info = { link = "NonText" },
      SLNormal = { bg = c.blue, fg = c.base },
      SLNormalAlt = { bg = c.none, fg = c.blue },
      SLInsert = { bg = c.green, fg = c.base },
      SLInsertAlt = { bg = c.none, fg = c.green },
      SLVisual = { bg = c.mauve, fg = c.base },
      SLVisualAlt = { bg = c.none, fg = c.mauve },
      SLCommand = { fg = c.base },
      SLCommandAlt = { bg = c.none },
      SLSelect = { bg = c.pink, fg = c.base },
      SLSelectAlt = { bg = c.none, fg = c.pink },
      SLReplace = { bg = c.red, fg = c.base },
      SLReplaceAlt = { bg = c.none, fg = c.red },
      SLTerminal = { bg = c.green, fg = c.base },
      SLTerminalAlt = { bg = c.none, fg = c.green },
      SLItem = { bg = c.text, fg = c.base },
      SLItemAlt = { bg = c.none, fg = c.text },
      SLCopilotEnabled = { bg = c.green, fg = c.base },
      SLCopilotEnabledAlt = { bg = c.none, fg = c.green },
      SLCopilotDisabled = { bg = c.overlay2, fg = c.base },
      SLCopilotDisabledAlt = { bg = c.none, fg = c.overlay2 },
      SLDiagnosticError = { bg = c.red, fg = c.base },
      SLDiagnosticErrorAlt = { bg = c.none, fg = c.red },
      SLDiagnosticWarn = { bg = c.yellow, fg = c.base },
      SLDiagnosticWarnAlt = { bg = c.none, fg = c.yellow },
      SLDiagnosticInfo = { bg = c.sky, fg = c.base },
      SLDiagnosticInfoAlt = { bg = c.none, fg = c.sky },
      SLDiagnosticHint = { bg = c.teal, fg = c.base },
      SLDiagnosticHintAlt = { bg = c.none, fg = c.teal },
    }
  end,
  integrations = {
    blink_cmp = { enabled = true },
    gitsigns = true,
    mini = { enabled = true },
    neotree = true,
    rainbow_delimiters = true,
    treesitter_context = true,
  },
}

vim.cmd.colorscheme "catppuccin-nvim"
