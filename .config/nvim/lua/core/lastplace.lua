local status_ok, lastplace = pcall(require, "nvim-lastplace")
if not status_ok then
  vim.notify("Failed to load lastplace", "error")
  return
end

lastplace.setup {}
