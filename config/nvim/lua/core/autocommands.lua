-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
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
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Keep cursor center
vim.api.nvim_create_autocmd({
  "CursorHold",
  "CursorMoved",
  "TextYankPost",
  "InsertEnter",
  "InsertLeave",
  "TextChanged",
}, {
  group = vim.api.nvim_create_augroup("CenterCursor", { clear = true }),
  pattern = { "*" },
  callback = function()
    if vim.bo.filetype == "alpha" then
      return
    end
    vim.cmd [[ normal! zz]]
  end,
})

-- Auto format
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("AutoFormat", { clear = true }),
  pattern = "*",
  callback = function(args)
    require("conform").format {
      timeout_ms = 2000,
      lsp_fallback = true,
      buf = args.buf,
    }
  end,
})

-- Reopen files at your last edit position.
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("RestorePosition", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.fn.line "'\"" > 0 and vim.fn.line "'\"" <= vim.fn.line "$" then
      vim.fn.setpos(".", vim.fn.getpos "'\"")
    end
  end,
})

-- Show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter", "CmdlineLeave" }, {
  pattern = "*",
  callback = function()
    vim.cmd [[set cursorline]]
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave", "CmdlineEnter" }, {
  pattern = "*",
  callback = function()
    vim.cmd [[set nocursorline]]
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("ResizeSplits", { clear = true }),
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does
-- not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("AutoCreateDir", { clear = true }),
  callback = function(event)
    if event.match:match "^%w%w+://" then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
