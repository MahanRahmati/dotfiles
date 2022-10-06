local status_ok, colorscheme = pcall(require, "base46")
if not status_ok then
  vim.notify("Failed to load colorscheme", "error")
  return
end

local config = require("core.utils").load_config()

vim.g.nvchad_theme = config.ui.theme
vim.g.transparency = config.ui.transparency

colorscheme.load_theme()

local highlights = {
  "alpha",
  "blankline",
  "cmp",
  "devicons",
  "git",
  "lsp",
  "mason",
  "notify",
  "nvimtree",
  "telescope",
  "treesitter",
  "whichkey",
}

for _, highlight in pairs(highlights) do
  colorscheme.load_highlight(highlight)
end
