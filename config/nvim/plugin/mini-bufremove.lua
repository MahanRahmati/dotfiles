vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    vim.pack.add { "https://github.com/nvim-mini/mini.bufremove" }
    require("mini.bufremove").setup {}

    vim.keymap.set(
      "n",
      "<leader>c",
      require("mini.bufremove").delete,
      { desc = "Close Buffer" }
    )
  end,
})
