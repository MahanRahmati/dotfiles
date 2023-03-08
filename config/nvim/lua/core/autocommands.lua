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
  pattern = "*",
  callback = function()
    vim.lsp.buf.format { timeout = 2000 }
  end,
})

-- Reopen files at your last edit position.
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.cmd [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif]]
  end,
})
