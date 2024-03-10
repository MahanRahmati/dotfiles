return {
  {
    "echasnovski/mini.comment",
    version = false,
    event = "VeryLazy",
    opts = {
      options = {
        ignore_blank_line = true,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
      vim.keymap.set(
        "n",
        "<leader>/",
        "<cmd>norm gcc<cr>",
        { desc = "Comment" }
      )
      vim.keymap.set(
        "v",
        "<leader>/",
        "<cmd>norm gcc<cr>",
        { desc = "Comment" }
      )
    end,
  },
}
