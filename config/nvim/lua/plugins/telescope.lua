local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("Failed to load telescope", "error")
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    path_display = { "smart" },
    layout_strategy = "flex",
    file_ignore_patterns = {
      ".git/",
      "%.lock",
      "node_modules/*",
      ".dart_tool/",
      ".github/",
      ".gradle/",
      ".idea/",
      ".settings/",
      ".vscode/",
      "__pycache__/",
      "build/",
      "env/",
      "gradle/",
      "node_modules/",
      "%.mp4",
      "%.mkv",
      "%.rar",
      "%.zip",
      "%.7z",
      "%.tar",
      "%.bz2",
      "%.tar.gz",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
}
