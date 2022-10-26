local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
  vim.notify("Failed to load scrollbar", "error")
  return
end

scrollbar.setup {}
