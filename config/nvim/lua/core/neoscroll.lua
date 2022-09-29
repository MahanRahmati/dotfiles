local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  vim.notify("Failed to load neoscroll", "error")
  return
end

neoscroll.setup {}
