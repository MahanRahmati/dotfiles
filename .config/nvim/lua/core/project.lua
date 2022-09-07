local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  require "notify"("Failed to load project-nvim", "error")
  return
end

project.setup {
  detection_methods = { "pattern", "lsp" },
}

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  require "notify"("Failed to load telescope", "error")
  return
end

telescope.load_extension "projects"
