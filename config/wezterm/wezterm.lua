local wezterm = require "wezterm"

local function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

local function background_color(appearance)
  if appearance:find "Dark" then
    return "#0E1116"
  else
    return "#EFF1F5"
  end
end

wezterm.on("window-config-reloaded", function(window, _)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  local background = background_color(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    overrides.colors = {
      background = background,
    }
    window:set_config_overrides(overrides)
  end
end)

return {
  bidi_enabled = true,
  check_for_updates = false,
  enable_tab_bar = false,
  font = wezterm.font("Hack Nerd Font", { weight = "Regular" }),
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
