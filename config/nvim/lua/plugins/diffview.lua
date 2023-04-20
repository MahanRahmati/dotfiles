local diffview = require("core.import").import "diffview"
if diffview == nil then
  return
end

diffview.setup {
  keymaps = {
    view = {
      { "n", "q", ":DiffviewClose<cr>", { desc = "Close diffview" } },
      { "n", "<esc>", ":DiffviewClose<cr>", { desc = "Close diffview" } },
    },
    file_panel = {
      { "n", "q", ":DiffviewClose<cr>", { desc = "Close diffview" } },
      { "n", "<esc>", ":DiffviewClose<cr>", { desc = "Close diffview" } },
    },
  },
}

vim.opt.fillchars:append { diff = "╱" }
