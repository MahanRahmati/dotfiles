local virt_column = require("core.import").import "virt-column"
if virt_column == nil then
  return
end

local icons = require "core.icons"

virt_column.setup {
  char = icons.virt_line,
}
