local virt_column = require("core.import").import "virt-column"
if virt_column == nil then
  return
end

virt_column.setup {
  char = "┆",
}
