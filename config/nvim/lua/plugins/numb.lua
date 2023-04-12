local status_ok, numb = pcall(require, "numb")
if not status_ok then
  vim.notify("Failed to load numb", vim.log.levels.ERROR)
  return
end

numb.setup {}
