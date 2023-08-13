local indent_blankline = require("core.import").import "indent_blankline"
if indent_blankline == nil then
  return
end

local icons = require "core.icons"

indent_blankline.setup {
  char = icons.indent_line,
  filetype_exclude = {
    "lspinfo",
    "checkhealth",
    "help",
    "man",
    "",
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  -- use_treesitter = true,
  show_current_context = true,
}
