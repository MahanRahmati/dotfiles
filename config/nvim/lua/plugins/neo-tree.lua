local icons = require "icons"

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    opts = {
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
      window = {
        width = 40,
        auto_expand_width = true,
        popup = {
          position = { col = "1%", row = "2" },
          size = function(state)
            local root_name = vim.fn.fnamemodify(state.path, ":~")
            local root_len = string.len(root_name) + 4
            return {
              width = math.max(root_len, 40),
              height = vim.o.lines - 3,
            }
          end,
        },
      },
      nesting_rules = {
        ["dart"] = { "g.dart", "freezed.dart" },
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
    },
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree float reveal_force_cwd<cr>",
        desc = "File Explorer",
      },
    },
  },
}
