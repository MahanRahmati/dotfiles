local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  vim.notify("Failed to load todo-comments", vim.log.levels.ERROR)
  return
end

todo_comments.setup {}
