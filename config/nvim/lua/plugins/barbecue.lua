local barbecue = require("core.import").import "barbecue"
if barbecue == nil then
  return
end

barbecue.setup {
  create_autocmd = false,
  show_dirname = false,
  show_modified = true,
  symbols = {
    modified = "",
  },
}

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "WinResized",
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  "BufWritePost",
  "TextChanged",
  "TextChangedI",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})
