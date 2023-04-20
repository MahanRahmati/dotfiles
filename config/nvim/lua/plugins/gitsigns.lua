local gitsigns = require("core.import").import "gitsigns"
if gitsigns == nil then
  return
end

gitsigns.setup {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "契" },
    topdelete = { text = "契" },
    changedelete = { text = "▎" },
    untracked = { text = "┆" },
  },
  current_line_blame = true,
}
