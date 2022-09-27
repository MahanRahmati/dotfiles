local status_ok, better_escape = pcall(require, "better_escape")
if not status_ok then
  vim.notify("Failed to load better-escape", "error")
  return
end

better_escape.setup {}
