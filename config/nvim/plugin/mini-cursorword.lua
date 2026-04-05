vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    vim.pack.add { "https://github.com/nvim-mini/mini.cursorword" }
    require("mini.cursorword").setup {}
  end,
})
