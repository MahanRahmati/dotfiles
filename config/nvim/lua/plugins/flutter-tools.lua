return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    opts = {
      ui = {
        border = "rounded",
      },
      root_patterns = { ".git", ".metadata" },
      dev_log = {
        enabled = true,
        notify_errors = false,
        open_cmd = "15new",
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
    config = function(_, opts)
      require("flutter-tools").setup(opts)

      -- Run OrganizeImports and FixAll on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Run OrganizeImports and FixAll on save",
        group = vim.api.nvim_create_augroup("FlutterActions", { clear = true }),
        pattern = { "*.dart" },
        callback = function()
          vim.cmd.OrganizeImports()
          vim.cmd.FixAll()
        end,
      })
    end,
  },
}
