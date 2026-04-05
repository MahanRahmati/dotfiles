vim.pack.add {
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-flutter/flutter-tools.nvim",
  "https://github.com/nvim-flutter/pubspec-assist.nvim",
}

require("pubspec-assist").setup {}

require("flutter-tools").setup {
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
}

vim.keymap.set("n", "<leader>F", "", { desc = "Flutter" })
vim.keymap.set(
  "n",
  "<leader>FD",
  "<cmd>FlutterDevTools<CR>",
  { desc = "Dev Tools" }
)
vim.keymap.set(
  "n",
  "<leader>Fd",
  "<cmd>FlutterDevices<CR>",
  { desc = "Devices" }
)
vim.keymap.set(
  "n",
  "<leader>Fe",
  "<cmd>FlutterEmulators<CR>",
  { desc = "Emulators" }
)
vim.keymap.set(
  "n",
  "<leader>Fh",
  "<cmd>FlutterReload<CR>",
  { desc = "Hot Reload" }
)
vim.keymap.set(
  "n",
  "<leader>Fl",
  "<cmd>FlutterLspRestart<CR>",
  { desc = "LSP Restart" }
)
vim.keymap.set(
  "n",
  "<leader>FR",
  "<cmd>FlutterRestart<CR>",
  { desc = "Restart" }
)
vim.keymap.set("n", "<leader>Fr", "<cmd>FlutterRun<CR>", { desc = "Run" })
vim.keymap.set("n", "<leader>Fq", "<cmd>FlutterQuit<CR>", { desc = "Quit" })
vim.keymap.set(
  "n",
  "<leader>Ft",
  "<cmd>FlutterLogToggle<CR>",
  { desc = "Log Toggle" }
)
