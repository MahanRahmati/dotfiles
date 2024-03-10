return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {},
      },
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          -- Neovim
          "lua",
          "luadoc",
          "luap",
          "vim",
          "vimdoc",
          -- Flutter
          "dart",
          "yaml",
          -- Json
          "json",
          "jsonc",
          -- Shell
          "bash",
          -- Markdown
          "markdown",
          "markdown_inline",
        },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
