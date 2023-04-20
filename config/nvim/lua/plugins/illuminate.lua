local illuminate = require("core.import").import "illuminate"
if illuminate == nil then
  return
end

illuminate.configure {
  filetypes_denylist = {
    "alpha",
    "lazy",
    "mason",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
  },
}
