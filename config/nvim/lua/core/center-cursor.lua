vim.api.nvim_create_autocmd({ "CursorMoved", "BufEnter", "TextChanged" }, {
  group = vim.api.nvim_create_augroup("CenterCursor", { clear = true }),
  pattern = { "*" },
  callback = function()
    if
      vim.bo.filetype == "alpha"
      or vim.bo.filetype == "TelescopePrompt"
      or vim.bo.filetype == "TelescopeResults"
    then
      return
    end
    vim.cmd "norm! zz"
  end,
})

vim.api.nvim_create_autocmd({ "CursorMovedI", "WinScrolled" }, {
  group = vim.api.nvim_create_augroup("CenterCursorI", { clear = true }),
  pattern = { "*" },
  callback = function()
    if
      vim.bo.filetype == "alpha"
      or vim.bo.filetype == "TelescopePrompt"
      or vim.bo.filetype == "TelescopeResults"
    then
      return
    end
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.cmd "norm! zz"
    local column = vim.fn.getcurpos()[5]
    vim.fn.cursor { line, column }
  end,
})
