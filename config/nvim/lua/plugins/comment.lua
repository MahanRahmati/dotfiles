local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  vim.notify("Failed to load Comment", "error")
  return
end

comment.setup {
  ignore = "^$", -- Ignores empty lines
}
