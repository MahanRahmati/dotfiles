vim.api.nvim_create_autocmd({
  "CursorMoved",
  "CursorMovedI",
  "BufEnter",
  "TextChanged",
  "WinScrolled",
}, {
  group = vim.api.nvim_create_augroup("CenterCursor", { clear = true }),
  pattern = { "*" },
  callback = function()
    if vim.bo.filetype == "alpha" then
      return
    end
    vim.cmd "norm! zz"
  end,
})
