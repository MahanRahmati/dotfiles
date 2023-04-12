local status_ok, smoothcursor = pcall(require, "smoothcursor")
if not status_ok then
  vim.notify("Failed to load smoothcursor", vim.log.levels.ERROR)
  return
end

smoothcursor.setup {}
