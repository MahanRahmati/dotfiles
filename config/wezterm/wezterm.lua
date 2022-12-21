local wezterm = require "wezterm"

local base_16 = {
  base00 = "#1e222a",
  base01 = "#353b45",
  base02 = "#3e4451",
  base03 = "#545862",
  base04 = "#565c64",
  base05 = "#abb2bf",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#e06c75",
  base09 = "#d19a66",
  base0A = "#e5c07b",
  base0B = "#98c379",
  base0C = "#56b6c2",
  base0D = "#61afef",
  base0E = "#c678dd",
  base0F = "#be5046",
}

return {
  check_for_updates = false,
  colors = {
    ansi = {
      base_16.base00,
      base_16.base0F,
      base_16.base0B,
      base_16.base0A,
      base_16.base0D,
      base_16.base0E,
      base_16.base0C,
      base_16.base03,
    },
    background = base_16.base00,
    cursor_bg = base_16.base05,
    cursor_border = base_16.base05,
    cursor_fg = base_16.base04,
    foreground = base_16.base05,
    selection_bg = base_16.base02,
    selection_fg = base_16.base04,
  },
  font = wezterm.font "Hack Nerd Font",
  font_size = 16,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  window_background_opacity = 0.97,
  window_padding = {
    left = "0.25cell",
    right = "0.25cell",
    top = "0.25cell",
    bottom = "0",
  },
}
