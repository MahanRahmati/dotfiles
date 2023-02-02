local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  vim.notify("Failed to load gitsigns", "error")
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
