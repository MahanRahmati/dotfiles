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
