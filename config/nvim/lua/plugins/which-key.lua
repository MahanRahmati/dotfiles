return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 100
    end,
    opts = {
      spelling = { enabled = true },
      window = {
        border = "rounded",
      },
      layout = {
        align = "center",
        height = { min = 4, max = 75 },
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
