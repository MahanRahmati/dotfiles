local status_ok, lastplace = pcall(require, "nvim-lastplace")
if not status_ok then
  require "notify"("Failed to load lastplace", "error")
  return
end

lastplace.setup {}
