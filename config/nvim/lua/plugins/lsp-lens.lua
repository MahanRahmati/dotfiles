local lsp_lens = require("core.import").import "lsp-lens"
if lsp_lens == nil then
  return
end

lsp_lens.setup {
  enable = true,
  include_declaration = false, -- Reference include declaration
  sections = {
    definition = false,
    references = true,
    implementation = true,
  },
  ignore_filetype = {
    "prisma",
  },
}
