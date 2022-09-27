local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Failed to load lspconfig", "error")
  return
end

require "core.lsp.mason"
require("core.lsp.handlers").setup()
require "core.lsp.null-ls"
