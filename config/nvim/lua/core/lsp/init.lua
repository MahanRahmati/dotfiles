local lspconfig = require("core.import").import "lspconfig"
if lspconfig == nil then
  return
end

require "core.lsp.mason"
require("core.lsp.handlers").setup()
