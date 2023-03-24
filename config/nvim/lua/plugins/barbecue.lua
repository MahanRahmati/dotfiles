local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
  vim.notify("Failed to load barbecue", "error")
  return
end

barbecue.setup {}
