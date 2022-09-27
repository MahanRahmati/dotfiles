local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  vim.notify("Failed to load indent-blankline", "error")
  return
end

indent_blankline.setup {
  char = "▏",
  filetype_exclude = {
    "lspinfo",
    "packer",
    "checkhealth",
    "help",
    "man",
    "terminal",
    "",
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = true,
}
