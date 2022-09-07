local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
  require "notify"("Failed to load dressing", "error")
  return
end

dressing.setup {}
