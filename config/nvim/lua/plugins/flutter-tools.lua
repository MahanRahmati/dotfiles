local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
  vim.notfiy("Failed to load flutter-tools", "error")
  return
end

local on_attach = require("core.lsp.handlers").on_attach
local capabilities = require("core.lsp.handlers").capabilities

flutter_tools.setup {
  ui = {
    border = "rounded",
    notification_style = "plugin",
  },
  lsp = {
    color = {
      enabled = true,
    },
    on_attach = on_attach,
    capabilities = capabilities,
  },
}
