local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require "plugins/autopairs",
  require "plugins/bufdelete",
  require "plugins/catppuccin",
  require "plugins/cmp",
  require "plugins/colorizer",
  require "plugins/conform",
  require "plugins/dashboard-nvim",
  require "plugins/devicons-auto-colors",
  require "plugins/dressing",
  require "plugins/fidget",
  require "plugins/flutter-tools",
  require "plugins/gitsigns",
  require "plugins/heirline",
  require "plugins/illuminate",
  require "plugins/indent-blankline",
  require "plugins/lazydev",
  require "plugins/lspconfig",
  require "plugins/mini-clue",
  require "plugins/neo-tree",
  require "plugins/notify",
  require "plugins/numb",
  require "plugins/sg",
  require "plugins/telescope",
  require "plugins/toggleterm",
  require "plugins/treesitter",
  require "plugins/virt-column",
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
