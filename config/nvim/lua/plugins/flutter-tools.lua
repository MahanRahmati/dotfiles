local flutter_tools = require("core.import").import "flutter-tools"
if flutter_tools == nil then
  return
end

local on_attach = require("core.lsp.handlers").on_attach
local capabilities = require("core.lsp.handlers").capabilities

flutter_tools.setup {
  ui = {
    border = "rounded",
  },
  dev_log = {
    enabled = true,
    notify_errors = false,
    open_cmd = "15new",
  },
  lsp = {
    color = {
      enabled = true,
    },
    on_attach = on_attach,
    capabilities = capabilities,
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
}

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("FlutterActions", { clear = true }),
  pattern = { "*.dart" },
  callback = function()
    vim.cmd.OrganizeImports()
    vim.cmd.FixAll()
    vim.cmd.Format()
  end,
})
