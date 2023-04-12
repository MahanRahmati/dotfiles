local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  vim.notify("Failed to load colorizer", vim.log.levels.ERROR)
  return
end

colorizer.setup {}
