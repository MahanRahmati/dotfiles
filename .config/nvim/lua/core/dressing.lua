local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
  vim.notify("Failed to load dressing", "error")
  return
end

dressing.setup {}
