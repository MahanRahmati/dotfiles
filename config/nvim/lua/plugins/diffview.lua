local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
  vim.notify("Failed to load diffview", vim.log.levels.ERROR)
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
