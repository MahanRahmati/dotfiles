local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  require "notify"("Failed to load alpha", "error")
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  [[                                                 ]],
}

dashboard.section.buttons.val = {
  dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
  dashboard.button("p", "ﱮ  Recent Projects ", "<CMD>Telescope projects<CR>"),
  dashboard.button(
    "c",
    "  Configuration",
    ":e ~/.config/nvim/init.lua <CR>"
  ),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  -- button("l", "   Open Last Session", ':lua require("persisted").load()<CR>'),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
