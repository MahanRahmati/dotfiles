return {
  {
    "echasnovski/mini.comment",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      options = {
        ignore_blank_line = true,
      },
    },
    keys = {
      { "<leader>/", "<cmd>norm gcc<CR>", desc = "Comment" },
      { "<leader>/", "<cmd>norm gcc<CR>", mode = "v", desc = "Comment" },
    },
  },
}
