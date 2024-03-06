--     _   __                    _
--    / | / /___   ____  _   __ (_)____ ___
--   /  |/ // _ \ / __ \| | / // // __ `__ \
--  / /|  //  __// /_/ /| |/ // // / / / / /
-- /_/ |_/ \___/ \____/ |___//_//_/ /_/ /_/
--

require "core.options"
require "core.autocommands"
require "core.keymaps"
require "core.plugins"

----------------------------------------------------------------------
--                       Load Configurations                        --
----------------------------------------------------------------------

for _, source in ipairs {
  "core.center-cursor",
  "core.usercommands",
  "plugins.notify",
  "core.luasnip",
  "core.cmp",
  "core.lsp",
  "plugins.flutter-tools",
  "plugins.mini",
  "plugins.sg",
  "plugins.telescope",
} do
  local status_ok, error = pcall(require, source)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. error)
  end
end
