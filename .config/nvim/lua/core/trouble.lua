local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  require "notify"("Failed to load trouble", "error")
  return
end

trouble.setup {}
