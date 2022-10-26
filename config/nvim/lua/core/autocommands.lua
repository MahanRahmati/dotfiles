-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Close fidget before exiting neovim. TODO: Remove this when fidget is updated.
vim.api.nvim_create_autocmd(
  "VimLeavePre",
  { command = [[silent! FidgetClose]] }
)

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})

-- Make cursor stay centered.
function StayCentered(inInsert)
  local line = vim.api.nvim_win_get_cursor(0)[1]
  if line ~= vim.b.last_line then
    vim.cmd "norm! zz"
    vim.b.last_line = line
    if inInsert then
      local column = vim.fn.getcurpos()[5]
      vim.fn.cursor(line, column)
    end
  end
end

local group = vim.api.nvim_create_augroup("StayCentered", { clear = true })
vim.api.nvim_create_autocmd("CursorMovedI", {
  group = group,
  callback = function()
    StayCentered(true)
  end,
})
vim.api.nvim_create_autocmd("CursorMoved", {
  group = group,
  callback = function()
    StayCentered(false)
  end,
})
