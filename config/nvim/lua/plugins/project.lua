local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  vim.notify("Failed to load project-nvim", "error")
  return
end

project.setup {
  detection_methods = { "pattern", "lsp" },
}
