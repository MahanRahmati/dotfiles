local on_attach = require("core.lsp.handlers").on_attach

require("sg").setup {
  enable_cody = true,
  on_attach = on_attach,
}
