local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  vim.notify("Failed to load Comment", vim.log.levels.ERROR)
  return
end

comment.setup {
  ignore = "^$", -- Ignores empty lines
}
