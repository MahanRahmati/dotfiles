local sg = require("core.import").import "sg"
if sg == nil then
  return
end

local on_attach = require("core.lsp.handlers").on_attach

sg.setup {
  on_attach = on_attach,
}
