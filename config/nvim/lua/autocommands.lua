local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Use 'q' to quit from common plugins
autocmd({ "FileType" }, {
  desc = "Use q to quit from common plugins",
  group = augroup("q-in-plugins", { clear = true }),
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

-- Set wrap in markdown and gitcommit
autocmd({ "FileType" }, {
  desc = "Set wrap in markdown and gitcommit",
  group = augroup("wrap-for-markdown-and-gitcommit", { clear = true }),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

-- Highlight Yanked Text
autocmd({ "TextYankPost" }, {
  desc = "Highlight Yanked Text",
  group = augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Reopen files at your last edit position.
autocmd("BufReadPost", {
  desc = "Reopen files at your last edit position",
  group = augroup("restore-position", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.line "'\"" > 0 and vim.fn.line "'\"" <= vim.fn.line "$" then
      vim.fn.setpos(".", vim.fn.getpos "'\"")
    end
  end,
})

-- Show cursor line in active window
autocmd({ "InsertLeave", "WinEnter", "CmdlineLeave" }, {
  desc = "Show cursor line in active window",
  group = augroup("cursor-in-active-window", { clear = true }),
  pattern = "*",
  callback = function()
    vim.cmd [[set cursorline]]
  end,
})

-- Hide cursor line in inactive window
autocmd({ "InsertEnter", "WinLeave", "CmdlineEnter" }, {
  desc = "Hide cursor line in inactive window",
  group = augroup("hide-cursor-in-inactive-window", { clear = true }),
  pattern = "*",
  callback = function()
    vim.cmd [[set nocursorline]]
  end,
})

-- Resize splits if window got resized.
autocmd({ "VimResized" }, {
  desc = "Resize splits if window got resized",
  group = augroup("resize-splits", { clear = true }),
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Auto create directory when saving a file.
autocmd({ "BufWritePre" }, {
  desc = "Auto create directory when saving a file",
  group = augroup("auto-create-dir", { clear = true }),
  callback = function(event)
    if event.match:match "^%w%w+://" then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
