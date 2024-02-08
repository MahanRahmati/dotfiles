--     _   __                    _
--    / | / /___   ____  _   __ (_)____ ___
--   /  |/ // _ \ / __ \| | / // // __ `__ \
--  / /|  //  __// /_/ /| |/ // // / / / / /
-- /_/ |_/ \___/ \____/ |___//_//_/ /_/ /_/
--

----------------------------------------------------------------------
--                       Installation of Lazy                       --
----------------------------------------------------------------------

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

----------------------------------------------------------------------
--                       Load Configurations                        --
----------------------------------------------------------------------

for _, source in ipairs {
  "core.options",
  "core.autocommands",
  "core.center-cursor",
  "core.usercommands",
  "core.plugins",
  "plugins.notify",
  "core.luasnip",
  "core.cmp",
  "core.lsp",
  "core.treesitter",
  "plugins.flutter-tools",
  "plugins.illuminate",
  "plugins.lualine",
  "plugins.mini",
  "plugins.project",
  "plugins.sg",
  "plugins.telescope",
  "plugins.todo-comments",
  "plugins.treesitter-context",
} do
  local status_ok, error = pcall(require, source)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. error)
  end
end
