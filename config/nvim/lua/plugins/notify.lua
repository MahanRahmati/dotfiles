local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.api.nvim_err_writeln "Failed to load notify"
  return
end

notify.setup {
  -- background_colour = "#000000",
}

vim.notify = notify
