local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  require "notify"("Failed to load alpha", "error")
  return
end

local config = require("alpha.themes.theta").config
local dashboard = require "alpha.themes.dashboard"

local buttons = {
  type = "group",
  val = {
    {
      type = "text",
      val = "Quick links",
      opts = { hl = "SpecialComment", position = "center" },
    },
    { type = "padding", val = 1 },
    dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
    { type = "padding", val = 1 },
    dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
    { type = "padding", val = 1 },
    dashboard.button(
      "r",
      "ﱮ  Recent Projects ",
      "<CMD>Telescope projects<CR>"
    ),
    { type = "padding", val = 1 },
    dashboard.button(
      "c",
      "  Configuration",
      ":e ~/.config/nvim/init.lua <CR>"
    ),
    { type = "padding", val = 1 },
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    { type = "padding", val = 1 },
  },
  position = "center",
}

config.layout[6] = buttons
alpha.setup(config)
