local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  vim.notify("Failed to load trouble", "error")
  return
end

trouble.setup {}
