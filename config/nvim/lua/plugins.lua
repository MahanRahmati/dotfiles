----------------------------------------------------------------------
--                               Lazy                               --
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

require("lazy").setup({
  require "plugins/alpha",
  require "plugins/catppuccin",
  require "plugins/colorizer",
  require "plugins/comment-frame",
  require "plugins/conform",
  require "plugins/dressing",
  require "plugins/gitsigns",
  require "plugins/illuminate",
  require "plugins/indent-blankline",
  require "plugins/lualine",
}, {
  ui = { border = "rounded" },
})
