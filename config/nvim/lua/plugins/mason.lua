return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = function()
      local icons = require "icons"
      return {
        ui = {
          border = "rounded",
          max_concurrent_installers = 4,
          width = 1.0,
          height = 1.0,
          icons = {
            package_installed = icons.package_installed,
            package_pending = icons.package_pending,
            package_uninstalled = icons.package_uninstalled,
          },
        },
      }
    end,
    config = function(_, opts)
      require("mason").setup(opts)
      require("mason-tool-installer").setup {}
    end,
    keys = {
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason", silent = true },
    },
  },
}
