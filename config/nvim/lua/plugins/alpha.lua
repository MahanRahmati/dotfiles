local alpha = require("core.import").import "alpha"
if alpha == nil then
  return
end

local config = require("alpha.themes.theta").config
local dashboard = require "alpha.themes.dashboard"

local header = {
  type = "text",
  val = {
    [[    _   __                    _          ]],
    [[   / | / /___   ____  _   __ (_)____ ___ ]],
    [[  /  |/ // _ \ / __ \| | / // // __ `__ \]],
    [[ / /|  //  __// /_/ /| |/ // // / / / / /]],
    [[/_/ |_/ \___/ \____/ |___//_//_/ /_/ /_/ ]],
    [[                                         ]],
  },
  opts = {
    position = "center",
    hl = "Type",
    -- wrap = "overflow";
  },
}

local icons = require "core.icons"

local buttons = {
  type = "group",
  val = {
    {
      type = "text",
      val = "Quick links",
      opts = { hl = "SpecialComment", position = "center" },
    },
    { type = "padding", val = 1 },
    dashboard.button(
      "n",
      icons.file .. " New File",
      ":ene <BAR> startinsert <CR>"
    ),
    { type = "padding", val = 1 },
    dashboard.button(
      "f",
      icons.find .. " Find File",
      ":Telescope find_files <CR>"
    ),
    { type = "padding", val = 1 },
    dashboard.button(
      "r",
      icons.folder .. " Recent Projects ",
      "<CMD>Telescope projects<CR>"
    ),
    { type = "padding", val = 1 },
    dashboard.button(
      "c",
      icons.configuration .. " Configuration",
      ":e ~/.config/nvim/init.lua <CR>"
    ),
    { type = "padding", val = 1 },
    dashboard.button("l", icons.lazy .. " Lazy", ":Lazy<CR>"),
    { type = "padding", val = 1 },
    dashboard.button("q", icons.quit .. " Quit Neovim", ":qa<CR>"),
    { type = "padding", val = 1 },
  },
  position = "center",
}

config.layout[2] = header
config.layout[6] = buttons
alpha.setup(config)
