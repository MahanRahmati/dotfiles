local status_ok, auto_save = pcall(require, "auto-save")
if not status_ok then
  vim.notify("Failed to load auto-save", "error")
  return
end

auto_save.setup {}
