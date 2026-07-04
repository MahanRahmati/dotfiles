vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    vim.pack.add { "https://github.com/dlyongemallo/diffview-plus.nvim" }

    local icons = require "icons"

    local actions = require "diffview.actions"

    require("diffview").setup {
      enhanced_diff_hl = true,
      use_icons = true,
      show_help_hints = false,
      show_root_path = false,
      auto_close_on_empty = true,
      clean_up_buffers = true,
      icons = {
        folder_closed = icons.folder_filled,
        folder_open = icons.folder_filled,
      },
      status_icons = {
        ["A"] = icons.added,
        ["?"] = icons.untracked,
        ["M"] = icons.modified,
        ["R"] = icons.renamed,
        ["C"] = "C", -- Copied
        ["T"] = "T", -- Type changed
        ["U"] = "U", -- Unmerged
        ["X"] = icons.untracked,
        ["D"] = icons.removed,
        ["B"] = icons.conflict,
        ["!"] = icons.ignored,
      },
      signs = icons.diffview,
      view = {
        default = {
          layout = "diff1_inline",
          winbar_info = false,
        },
      },
      file_panel = {
        listing_style = "list",
        list_options = {
          path_style = "full",
        },
        win_config = { position = "left", width = 42 },
      },
      hooks = {
        view_enter = function()
          pcall(function()
            vim.opt.winbar = ""
          end)
        end,
        view_leave = function()
          pcall(function()
            vim.opt.winbar = "%{%v:lua.get_winbar()%}"
          end)
        end,
      },

      keymaps = {
        disable_defaults = true,
        view = {
          {
            "n",
            "q",
            "<cmd>DiffviewToggle<cr>",
            { desc = "Toggle Diffview" },
          },
          {
            "n",
            "<leader>q",
            "<cmd>DiffviewToggle<cr>",
            { desc = "Toggle Diffview" },
          },
        },
        file_panel = {
          {
            "n",
            "q",
            "<cmd>DiffviewToggle<cr>",
            { desc = "Toggle Diffview" },
          },
          {
            "n",
            "<leader>q",
            "<cmd>DiffviewToggle<cr>",
            { desc = "Toggle Diffview" },
          },
          {
            "n",
            "<cr>",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
          {
            "n",
            "<2-LeftMouse>",
            actions.select_entry,
            { desc = "Open the diff for the selected entry" },
          },
        },
      },
    }
    vim.keymap.set(
      "n",
      "<leader>gd",
      "<cmd>DiffviewToggle<cr>",
      { desc = "Toggle Diffview" }
    )
  end,
})
