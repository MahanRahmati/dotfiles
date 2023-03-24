local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
  vim.notify("Failed to load barbecue", "error")
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
