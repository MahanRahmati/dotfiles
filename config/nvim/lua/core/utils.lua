local M = {}

M.load_config = function()
  return {
    ui = {
      hl_add = { EndOfBuffer = { fg = "#1e222a" } },
      hl_override = {},
      changed_themes = {},
      theme_toggle = { "onedark", "one_light" },
      theme = "onedark",
      transparency = false,
    },
  }
end

return M
