local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  vim.notify("Failed to load aerial", "error")
  return
end

aerial.setup {
  layout = {
    min_width = 30,
    filter_kind = false,
    show_guides = true,
  },
  filter_kind = false,
}
