local luasnip = require("core.import").import "luasnip"
if luasnip == nil then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load {
  paths = { "~/.config/nvim/snippets/" },
}

luasnip.config.setup {
  updateevents = "TextChanged,TextChangedI",
}
