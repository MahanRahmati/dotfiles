return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 100,
      win = {
        height = { min = 4, max = 75 },
        border = "rounded",
        title = false,
      },
      layout = {
        align = "center",
      },
      icons = {
        rules = false,
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)

      -- Document existing key chains
      require("which-key").add {
        { "<leader>f", group = "Finder" },
        { "<leader>F", group = "Flutter" },
        { "<leader>g", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>p", group = "Package Manager" },
      }
    end,
  },
}
