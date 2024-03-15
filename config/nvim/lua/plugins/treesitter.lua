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
    opts = {
      ensure_installed = {
        -- Neovim
        "lua",
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
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
