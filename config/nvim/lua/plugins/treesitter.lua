return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {},
      },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
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
        -- Go
        "go",
        "gomod",
        "gowork",
        "gosum",
        -- Zig
        "zig",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
