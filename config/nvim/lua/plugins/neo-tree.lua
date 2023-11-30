local neo_tree = require("core.import").import "neo-tree"
if neo_tree == nil then
  return
end

vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

local icons = require "core.icons"

neo_tree.setup {
  close_if_last_window = true,
  popup_border_style = "rounded",
  default_component_configs = {
    indent = {
      with_expanders = true,
    },
    icon = {
      folder_closed = icons.folder_filled,
      folder_open = icons.folder_filled,
      folder_empty = icons.folder_filled,
    },
    modified = {
      symbol = icons.modified,
    },
    git_status = {
      symbols = {
        added = icons.added,
        modified = icons.modified,
        deleted = icons.removed,
        renamed = icons.renamed,
        untracked = icons.untracked,
        ignored = icons.ignored,
        unstaged = icons.unstaged,
        staged = icons.staged,
        conflict = icons.conflict,
      },
    },
  },
  nesting_rules = {
    ["dart"] = { "g.dart", "freezed.dart" },
  },
  window = {
    width = 35,
    auto_expand_width = true,
    popup = {
      position = { col = "0%", row = "2" },
      size = function(state)
        local root_name = vim.fn.fnamemodify(state.path, ":~")
        local root_len = string.len(root_name) + 4
        return {
          width = math.max(root_len, 50),
          height = vim.o.lines - 4,
        }
      end,
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      show_hidden_count = false,
    },
  },
  event_handlers = {
    {
      event = "file_opened",
      handler = function(_)
        vim.cmd "Neotree close"
      end,
    },
  },
}
