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
    -- Rust
    "rust",
    "toml",
    -- Shell
    "bash",
    -- Go
    "go",
    "gomod",
    "gowork",
    "gosum",
    -- Markdown
    "markdown",
    "markdown_inline",
  },
  ignore_install = { "" },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "" },
  },
  indent = {
    enable = true,
    disable = { "yaml", "python" },
  },
  rainbow = {
    enable = true,
    disable = { "jsx", "cpp" },
    query = "rainbow-parens",
    strategy = require("ts-rainbow").strategy.global,
  },
}
