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

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Hide lualine in alpha
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "alpha" },
  callback = function()
    local status_ok, lualine = pcall(require, "lualine")
    if status_ok then
      lualine.hide()
    end
  end,
})

-- Show lualine in every other buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.bo.filetype ~= "alpha" then
      local status_ok, lualine = pcall(require, "lualine")
      if status_ok then
        lualine.hide { unhide = true }
        lualine.hide {
          place = { "statusline" },
        }
      end
    end
  end,
})
