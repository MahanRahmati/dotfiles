local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  require "notify"("Failed to load project-nvim", "error")
  return
end
project.setup {

  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearangne the detection methods.
  detection_methods = { "pattern", "lsp" },
}

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
  require "notify"("Failed to load telescope", "error")
  return
end

telescope.load_extension "projects"
