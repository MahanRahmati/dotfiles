local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  require "notify"("Failed to load Comment", "error")
  return
end

comment.setup {
  -- ignores empty lines
  ignore = "^$",
}
