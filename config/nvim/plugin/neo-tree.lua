vim.pack.add {
  {
    src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = vim.version.range "3",
  },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/saifulapm/neotree-file-nesting-config",
}

local icons = require "icons"
local nesting_rules = require("neotree-file-nesting-config").nesting_rules

require("neo-tree").setup {
  close_if_last_window = true,
  hide_root_node = true,
  retain_hidden_root_indent = true,
  popup_border_style = "",
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
    width = 42,
    auto_expand_width = true,
    popup = {
      position = { col = "1%", row = "2" },
      size = {
        width = 40,
        height = vim.o.lines - 4,
      },
      title = function(_)
        return ""
      end,
    },
  },
  nesting_rules = nesting_rules,
  filesystem = {
    filtered_items = {
      show_hidden_count = false,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function()
        require("neo-tree.command").execute { action = "close" }
      end,
    },
  },
}

vim.keymap.set(
  "n",
  "<leader>e",
  "<cmd>Neotree float reveal_force_cwd<CR>",
  { desc = "File Explorer" }
)
