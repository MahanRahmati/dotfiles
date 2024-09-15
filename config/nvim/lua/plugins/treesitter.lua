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
        "luadoc",
        "query",
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
        -- Go
        "go",
        "gomod",
        "gowork",
        "gosum",
        -- Zig
        "zig",
        -- PHP
        "php",
        "html",
        "css",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      local parser_config =
        require("nvim-treesitter.parsers").get_parser_configs()

      ---@diagnostic disable-next-line: inject-field
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },
}
