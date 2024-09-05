return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
      {
        "akinsho/pubspec-assist.nvim",
        event = "BufRead pubspec.yaml",
        opts = {},
      },
    },
    ft = "dart",
    event = "BufRead pubspec.yaml",
    opts = {
      ui = {
        border = "rounded",
      },
      root_patterns = { ".git", ".metadata" },
      dev_log = {
        enabled = true,
        notify_errors = false,
        open_cmd = "botright 10new",
      },
      lsp = {
        color = {
          enabled = true,
        },
        -- on_attach = on_attach,
        -- capabilities = capabilities,
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          analysisExcludedFolders = {
            "$HOME/.pub-cache/",
            vim.fn.expand "$HOME/.pub-cache",
            "/opt/homebrew/",
          },
          renameFilesWithClasses = "always",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      },
    },
    cmd = {
      "FlutterDevTools",
      "FlutterDevices",
      "FlutterEmulators",
      "FlutterReload",
      "FlutterLspRestart",
      "FlutterRestart",
      "FlutterRun",
      "FlutterQuit",
    },
    config = function(_, opts)
      require("flutter-tools").setup(opts)

      local ui = require "flutter-tools.ui"
      local Popup = require "nui.popup"
      local event = require("nui.utils.autocmd").event

      ---@diagnostic disable-next-line: duplicate-set-field
      ui.open_win = function(options, on_open)
        local bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_name(
          bufnr,
          options.filename or "__Flutter_Tools_Unknown__"
        )
        vim.bo[bufnr].filetype = options.filetype
        vim.bo[bufnr].swapfile = false
        vim.bo[bufnr].buftype = "nofile"
        vim.bo[bufnr].buflisted = false

        local popup = Popup {
          enter = true,
          focusable = true,
          border = {
            style = "rounded",
          },
          position = vim.o.lines - 15 - 4,
          size = {
            width = vim.o.columns,
            height = 15,
          },
          buf_options = {
            modifiable = true,
            readonly = false,
          },
          bufnr = bufnr,
        }

        local first_open = true

        local function toggle_popup()
          if popup.winid then
            popup:unmount()
          else
            local current_win = vim.api.nvim_get_current_win()
            popup:mount()
            if on_open then
              on_open(bufnr, popup.winid)
            end
            if first_open then
              vim.api.nvim_set_current_win(current_win)
              first_open = false
            else
              vim.api.nvim_set_current_win(popup.winid)
            end
          end
        end

        popup:on(event.BufWinLeave, function()
          popup:unmount()
        end)

        vim.keymap.set(
          "n",
          "<leader>Ft",
          toggle_popup,
          { desc = "Toggle Dev Logs" }
        )

        if options.open_cmd then
          toggle_popup()
        end
      end
    end,
    keys = {
      { "<leader>FD", "<cmd>FlutterDevTools<CR>", desc = "Dev Tools" },
      { "<leader>Fd", "<cmd>FlutterDevices<CR>", desc = "Devices" },
      { "<leader>Fe", "<cmd>FlutterEmulators<CR>", desc = "Emulators" },
      { "<leader>Fh", "<cmd>FlutterReload<CR>", desc = "Hot Reload" },
      { "<leader>Fl", "<cmd>FlutterLspRestart<CR>", desc = "LSP Restart" },
      { "<leader>FR", "<cmd>FlutterRestart<CR>", desc = "Restart" },
      { "<leader>Fr", "<cmd>FlutterRun<CR>", desc = "Run" },
      { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Quit" },
    },
  },
}
