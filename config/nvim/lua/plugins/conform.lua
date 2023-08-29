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
    fish = { "fish_indent" },
  },
}
