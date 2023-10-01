local indentmini = require("core.import").import "indentmini"
if indentmini == nil then
  return
end

local icons = require "core.icons"

indentmini.setup {
  char = icons.indent_line,
  exclude = {
    "lspinfo",
    "checkhealth",
    "help",
    "man",
    "alpha",
    "neo-tree",
    "lazy",
    "mason",
    "notify",
    "toggleterm",
  },
}
vim.cmd.highlight "default link IndentLine Whitespace"
