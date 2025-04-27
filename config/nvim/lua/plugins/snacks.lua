return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = function()
      local icons = require "icons"
      ---@type snacks.Config
      return {
        animate = { enabled = false },
        bigfile = { enabled = false },
        bufdelete = {},
        dashboard = { enabled = false },
        debug = { enabled = false },
        dim = { enabled = false },
        explorer = { enabled = false },
        git = { enabled = false },
        gitbrowse = { enabled = false },
        image = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        layout = { enabled = false },
        lazygit = {},
        notifier = { enabled = false },
        picker = { enabled = false },
        profiler = { enabled = false },
        quickfile = { enabled = false },
        rename = { enabled = false },
        scope = { enabled = false },
        scratch = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        terminal = { enabled = false },
        toggle = { enabled = false },
        util = { enabled = false },
        win = { enabled = false },
        words = { enabled = false },
        zen = { enabled = false },
        styles = {
          lazygit = {
            width = 0,
            height = vim.o.lines - 3,
            border = "rounded",
          },
        },
      }
    end,
    keys = {
      {
        "<leader>gg",
        ":lua require('snacks').lazygit()<CR>",
        desc = "LazyGit",
      },
      {
        "<leader>c",
        ":lua require('snacks').bufdelete()<CR>",
        desc = "Close Buffer",
      },
    },
  },
}
