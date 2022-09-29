local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  vim.notify("Failed to load colorizer", "error")
  return
end

colorizer.setup {}
