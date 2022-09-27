local status_ok, treesitter_context = pcall(require, "treesitter-context")
if not status_ok then
  vim.notify("Failed to load treesitter-context", "error")
  return
end

treesitter_context.setup {}
