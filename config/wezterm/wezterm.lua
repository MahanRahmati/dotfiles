local wezterm = require "wezterm"

return {
  bidi_enabled = true,
  check_for_updates = false,
  color_scheme = "Catppuccin Mocha",
  colors = {
    background = "#0E1116",
  },
  enable_tab_bar = false,
  font = wezterm.font "Hack Nerd Font",
  font_size = 16,
  keys = {
    {
      key = "t",
      mods = "CMD",
      action = wezterm.action.SplitHorizontal,
    },
  },
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
  window_padding = {
    left = "0.5cell",
    right = "0.5cell",
    top = "1.5cell",
    bottom = "0.0cell",
  },
}
