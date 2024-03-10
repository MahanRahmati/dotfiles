return {
  {
    "s1n7ax/nvim-comment-frame",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      keymap = "<leader>Cs",
      multiline_keymap = "<leader>Cm",
    },
  },
}
