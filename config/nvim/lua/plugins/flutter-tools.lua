return {
  {
    "nvim-flutter/flutter-tools.nvim",
    event = "BufRead pubspec.yaml",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-flutter/pubspec-assist.nvim",
        event = "BufRead pubspec.yaml",
        opts = {},
      },
    },
    ft = "dart",
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
      "FlutterLogToggle",
    },
    config = function(_, opts)
      require("flutter-tools").setup(opts)
    end,
    keys = {
      { "<leader>F", "", desc = "Flutter", ft = "dart" },
      {
        "<leader>FD",
        "<cmd>FlutterDevTools<CR>",
        desc = "Dev Tools",
        ft = "dart",
      },
      {
        "<leader>Fd",
        "<cmd>FlutterDevices<CR>",
        desc = "Devices",
        ft = "dart",
      },
      {
        "<leader>Fe",
        "<cmd>FlutterEmulators<CR>",
        desc = "Emulators",
        ft = "dart",
      },
      {
        "<leader>Fh",
        "<cmd>FlutterReload<CR>",
        desc = "Hot Reload",
        ft = "dart",
      },
      {
        "<leader>Fl",
        "<cmd>FlutterLspRestart<CR>",
        desc = "LSP Restart",
        ft = "dart",
      },
      {
        "<leader>FR",
        "<cmd>FlutterRestart<CR>",
        desc = "Restart",
        ft = "dart",
      },
      { "<leader>Fr", "<cmd>FlutterRun<CR>", desc = "Run", ft = "dart" },
      { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Quit", ft = "dart" },
      {
        "<leader>Ft",
        "<cmd>FlutterLogToggle<CR>",
        desc = "Log Toggle",
        ft = "dart",
      },
    },
  },
}
