local treesitter = require("core.import").import "nvim-treesitter.configs"
if treesitter == nil then
  return
end

treesitter.setup {
  ensure_installed = {
    "lua",
    "vim",
    "dart",
    "yaml",
    "rust",
    "toml",
    "bash",
    "json",
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
