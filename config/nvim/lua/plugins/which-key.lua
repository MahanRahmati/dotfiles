return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spelling = { enabled = true },
      window = {
        border = "rounded",
      },
      layout = {
        align = "center",
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)

      -- Document existing key chains
      require("which-key").register {
        ["<leader>f"] = { name = "Finder", _ = "which_key_ignore" },
        ["<leader>g"] = { name = "Git", _ = "which_key_ignore" },
        ["<leader>l"] = { name = "LSP", _ = "which_key_ignore" },
        ["<leader>p"] = { name = "Package Manager", _ = "which_key_ignore" },
      }
    end,
  },
}
