local status_ok, comment_frame = pcall(require, "nvim-comment-frame")
if not status_ok then
  vim.notify("Failed to load nvim-comment-frame", "error")
  return
end

comment_frame.setup {
  keymap = "<leader>Cf",
  multiline_keymap = "<leader>Cm",
}
