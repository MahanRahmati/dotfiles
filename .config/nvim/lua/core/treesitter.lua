local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("Failed to load nvim-treesitter.configs", "error")
  return
end

configs.setup {
  ensure_installed = {
    "lua",
    "dart",
    "rust",
    "python",
    "yaml",
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
  indent = { enable = true, disable = { "yaml", "python" } },
}
