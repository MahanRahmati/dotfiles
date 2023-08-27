local conform = require("core.import").import "conform"
if conform == nil then
  return
end

conform.setup {
  formatters_by_ft = {
    lua = { "stylua" },
    sh = { "shfmt" },
    dart = { "dart_format" },
    go = { "gofumpt" },
    format_on_save = {
      timeout_ms = 1500,
      lsp_fallback = true,
    },
  },
}
