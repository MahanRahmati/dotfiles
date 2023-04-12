local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("Failed to load telescope", vim.log.levels.ERROR)
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    path_display = { "smart" },
    layout_strategy = "flex",
    prompt_prefix = " ",
    selection_caret = " ",
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
  pickers = {
    find_files = {
      follow = true,
    },
  },
  extensions = {
    undo = {},
  },
}

telescope.load_extension "undo"
telescope.load_extension "projects"
