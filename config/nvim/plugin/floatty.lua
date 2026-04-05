vim.pack.add { "https://github.com/ingur/floatty.nvim" }

local term = require("floatty").setup {
  window = {
    row = function()
      return vim.o.lines - 15
    end,
    width = vim.o.columns,
    height = 15,
  },
}

vim.keymap.set("n", "<leader>t", function()
  term.toggle()
end, { desc = "Terminal" })
vim.keymap.set("t", "<leader>t", function()
  term.toggle()
end, { desc = "Terminal" })

local lazygit = require("floatty").setup {
  cmd = "lazygit",
  id = vim.fn.getcwd,
  window = {
    row = function()
      return 3
    end,
    width = vim.o.columns,
    height = vim.o.lines - 3,
  },
}

vim.keymap.set("n", "<leader>g", "", { desc = "Git" })
vim.keymap.set("n", "<leader>gg", function()
  lazygit.toggle()
end, { desc = "LazyGit" })

vim.api.nvim_create_autocmd({ "TermClose" }, {
  group = vim.api.nvim_create_augroup("terminal_close", { clear = true }),
  callback = function(_)
    vim.api.nvim_input "<CR>"
  end,
})
