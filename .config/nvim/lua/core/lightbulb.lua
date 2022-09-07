local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
if not status_ok then
  require "notify"("Failed to load lightbulb", "error")
  return
end

lightbulb.setup {}
