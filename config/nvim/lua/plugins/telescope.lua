local telescope = require("core.import").import "telescope"
if telescope == nil then
  return
end

local actions = require "telescope.actions"
local icons = require "core.icons"

telescope.setup {
  defaults = {
    path_display = { "smart" },
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        height = { padding = 0 },
        width = { padding = 0 },
        preview_cutoff = 1,
        prompt_position = "bottom",
      },
      vertical = {
        height = { padding = 0 },
        width = { padding = 0 },
        preview_cutoff = 1,
        prompt_position = "bottom",
      },
    },
    prompt_prefix = " " .. icons.find .. " ",
    selection_caret = icons.selection_caret,
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
      hidden = true,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
    },
  },
  extensions = {},
}

telescope.load_extension "projects"
