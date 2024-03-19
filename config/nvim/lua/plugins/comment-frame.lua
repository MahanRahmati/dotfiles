return {
  {
    "s1n7ax/nvim-comment-frame",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      disable_default_keymap = true,
    },
    keys = {
      {
        "<leader>Cs",
        "<cmd>lua require('nvim-comment-frame').add_comment()<CR>",
        desc = "Comment Singleline",
      },
      {
        "<leader>Cm",
        "<cmd>lua require('nvim-comment-frame').add_multiline_comment()<CR>",
        desc = "Comment Multiline",
      },
    },
  },
}
