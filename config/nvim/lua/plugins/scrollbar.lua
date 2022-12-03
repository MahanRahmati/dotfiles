local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
  vim.notify("Failed to load scrollbar", "error")
  return
end

scrollbar.setup {
  hide_if_all_visible = true,
  handlers = {
    cursor = true,
    diagnostic = true,
    gitsigns = true,
    handle = true,
  },
}

require("scrollbar.handlers.gitsigns").setup()
