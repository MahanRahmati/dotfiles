return {
  "adalessa/laravel.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
  },
  ft = { "php", "blade" },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  opts = {
    lsp_server = "phpactor",
    register_user_commands = true,
    features = {
      null_ls = {
        enable = false,
      },
      route_info = {
        enable = true,
        middlewares = true,
        method = true,
        uri = true,
        position = "right",
      },
    },
  },
  keys = {
    { "<leader>la", ":Laravel artisan<cr>" },
    { "<leader>lr", ":Laravel routes<cr>" },
    { "<leader>lm", ":Laravel related<cr>" },
  },
}
