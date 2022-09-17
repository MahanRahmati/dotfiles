local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  require "notify"("Failed to load colorizer", "error")
  return
end

colorizer.setup {}
