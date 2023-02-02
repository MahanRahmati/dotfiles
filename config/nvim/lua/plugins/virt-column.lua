local status_ok, virt_column = pcall(require, "virt-column")
if not status_ok then
  vim.notify("Failed to load virt-column", "error")
  return
end

virt_column.setup {
  char = "┆",
}
