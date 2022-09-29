local wezterm = require "wezterm"

return {
  check_for_updates = false,
  colors = {
    ansi = {
      "#0e1013",
      "#e55561",
      "#8ebd6b",
      "#e2b86b",
      "#4fa6ed",
      "#bf68d9",
      "#48b0bd",
      "#535965",
    },
    background = "#1f2329",
    brights = {
      "#7a818e",
      "#e55561",
      "#8ebd6b",
      "#e2b86b",
      "#4fa6ed",
      "#bf68d9",
      "#48b0bd",
      "#fffefe",
    },
    cursor_bg = "#a0a8b7",
    cursor_border = "#a0a8b7",
    cursor_fg = "#1f2329",
    foreground = "#a0a8b7",
    selection_bg = "#30363f",
    selection_fg = "#1f2329",
  },
  font = wezterm.font "Hack Nerd Font",
  font_size = 15,
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.95,
  window_padding = {
    left = "0.25cell",
    right = "0.25cell",
    top = "0.25cell",
    bottom = "0.25cell",
  },
}
