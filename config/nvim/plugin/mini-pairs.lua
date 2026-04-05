vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    vim.pack.add { "https://github.com/nvim-mini/mini.pairs" }
    require("mini.pairs").setup {}
  end,
})
