local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
  vim.notfiy("Failed to load flutter-tools", vim.log.levels.ERROR)
  return
end

local on_attach = require("core.lsp.handlers").on_attach
local capabilities = require("core.lsp.handlers").capabilities

flutter_tools.setup {
  ui = {
    border = "rounded",
    notification_style = "plugin",
  },
  dev_log = {
    enabled = true,
    open_cmd = "15new",
  },
  lsp = {
    color = {
      enabled = true,
    },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      completeFunctionCalls = true,
      showTodos = true,
      renameFilesWithClasses = "always",
      enableSnippets = true,
      updateImportsOnRename = true,
    },
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.dart" },
  callback = function()
    vim.cmd [[lua vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })]]
    vim.cmd [[lua vim.lsp.buf.code_action({ context = { only = { 'source.fixAll' } }, apply = true })]]
  end,
})
