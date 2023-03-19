local status_ok, easyread = pcall(require, "easyread")
if not status_ok then
  vim.notify("Failed to load easyread", "error")
  return
end

easyread.setup {}
