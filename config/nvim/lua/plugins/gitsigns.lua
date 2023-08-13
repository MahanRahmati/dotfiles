local gitsigns = require("core.import").import "gitsigns"
if gitsigns == nil then
  return
end

local icons = require "core.icons"

gitsigns.setup {
  signs = {
    add = { text = icons.gitsigns.add },
    change = { text = icons.gitsigns.change },
    delete = { text = icons.gitsigns.delete },
    topdelete = { text = icons.gitsigns.topdelete },
    changedelete = { text = icons.gitsigns.changedelete },
    untracked = { text = icons.gitsigns.untracked },
  },
  current_line_blame = true,
}
