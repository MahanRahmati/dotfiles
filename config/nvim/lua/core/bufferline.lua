local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify("Failed to load bufferline", "error")
  return
end

bufferline.setup {
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        padding = 1,
      },
    },
    show_close_icon = false,
    separator_style = { "", "" },
    always_show_bufferline = false,
  },
}
