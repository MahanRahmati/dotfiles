local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  require "notify"("Failed to load telescope", "error")
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
}
