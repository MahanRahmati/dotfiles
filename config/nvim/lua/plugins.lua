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
  require "plugins/autopairs",
  require "plugins/catppuccin",
  require "plugins/cmp",
  require "plugins/colorizer",
  require "plugins/comment-frame",
  require "plugins/conform",
  require "plugins/dressing",
  require "plugins/flutter-tools",
  require "plugins/gitsigns",
  require "plugins/illuminate",
  require "plugins/indent-blankline",
  require "plugins/lspconfig",
  require "plugins/lualine",
  require "plugins/mini-comment",
  require "plugins/neo-tree",
  require "plugins/notify",
  require "plugins/numb",
  require "plugins/telescope",
  require "plugins/toggleterm",
  require "plugins/treesitter",
  require "plugins/virt-column",
  require "plugins/which-key",
}, {
  ui = { border = "rounded" },
})

vim.keymap.set("n", "<leader>pc", "<cmd>Lazy check<CR>", { desc = "Check" })
vim.keymap.set("n", "<leader>pd", "<cmd>Lazy debug<CR>", { desc = "Debug" })
vim.keymap.set("n", "<leader>pi", "<cmd>Lazy install<CR>", { desc = "Install" })
vim.keymap.set("n", "<leader>pl", "<cmd>Lazy log<CR>", { desc = "Log" })
vim.keymap.set("n", "<leader>pp", "<cmd>Lazy profile<CR>", { desc = "Profile" })
vim.keymap.set("n", "<leader>pr", "<cmd>Lazy restore<CR>", { desc = "Restore" })
vim.keymap.set("n", "<leader>ps", "<cmd>Lazy sync<CR>", { desc = "Sync" })
vim.keymap.set("n", "<leader>pu", "<cmd>Lazy update<CR>", { desc = "Update" })
vim.keymap.set("n", "<leader>px", "<cmd>Lazy clean<CR>", { desc = "Clean" })
