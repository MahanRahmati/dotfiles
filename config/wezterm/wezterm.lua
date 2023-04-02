local wezterm = require "wezterm"

return {
  check_for_updates = false,
  color_scheme = "Catppuccin Mocha",
  colors = {
    background = "#0E1116",
  },
  font = wezterm.font "Hack Nerd Font",
  font_size = 16,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  window_background_opacity = 0.90,
  macos_window_background_blur = 20,
  window_padding = {
    left = "0.25cell",
    right = "0.25cell",
    top = "0.25cell",
    bottom = "0.25cell",
  },
}
