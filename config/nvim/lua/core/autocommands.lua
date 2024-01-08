local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Use 'q' to quit from common plugins
autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n",
      "q",
      "<cmd>close<cr>",
      { buffer = event.buf, silent = true }
    )
  end,
})

-- Set wrap and spell in markdown and gitcommit
autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Highlight Yanked Text
autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Reopen files at your last edit position.
autocmd("BufReadPost", {
  group = augroup("RestorePosition", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.line "'\"" > 0 and vim.fn.line "'\"" <= vim.fn.line "$" then
      vim.fn.setpos(".", vim.fn.getpos "'\"")
    end
  end,
})

-- Show cursor line only in active window
autocmd({ "InsertLeave", "WinEnter", "CmdlineLeave" }, {
  pattern = "*",
  callback = function()
    vim.cmd [[set cursorline]]
  end,
})

autocmd({ "InsertEnter", "WinLeave", "CmdlineEnter" }, {
  pattern = "*",
  callback = function()
    vim.cmd [[set nocursorline]]
  end,
})

-- Resize splits if window got resized
autocmd({ "VimResized" }, {
  group = augroup("ResizeSplits", { clear = true }),
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does
-- not exist
autocmd({ "BufWritePre" }, {
  group = augroup("AutoCreateDir", { clear = true }),
  callback = function(event)
    if event.match:match "^%w%w+://" then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
