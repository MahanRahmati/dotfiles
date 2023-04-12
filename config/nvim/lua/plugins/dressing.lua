local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
  vim.notify("Failed to load dressing", vim.log.levels.ERROR)
  return
end

dressing.setup {}
