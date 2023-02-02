local status_ok, auto_format = pcall(require, "auto-format")
if not status_ok then
  vim.notify("Failed to load auto-format", "error")
  return
end

auto_format.setup {
  timeout = 1000,
}
