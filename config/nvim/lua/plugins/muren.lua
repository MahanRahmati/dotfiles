local muren = require("core.import").import "muren"
if muren == nil then
  return
end

muren.setup {
  patterns_width = 20,
  patterns_height = 6,
  preview_height = 12,
  anchor = "top_right",
}
