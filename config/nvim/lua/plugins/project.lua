local project = require("core.import").import "project_nvim"
if project == nil then
  return
end

project.setup {
  detection_methods = { "pattern", "lsp" },
}
