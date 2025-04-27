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
        bigfile = {},
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
        notifier = {
          timeout = 3000,
          margin = { top = 0, right = 0, bottom = 0 },
          icons = {
            error = icons.error,
            warn = icons.warn,
            info = icons.info,
            debug = icons.debug,
            trace = icons.trace,
          },
          style = "compact",
          top_down = false,
        },
        picker = { enabled = false },
        profiler = { enabled = false },
        quickfile = { enabled = false },
        rename = { enabled = false },
        scope = { enabled = false },
        scratch = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        terminal = {},
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
          terminal = {
            width = 0,
            height = 15,
            border = "rounded",
            row = vim.o.lines - 3 - 15,
          },
          notification = {
            border = "rounded",
            wo = { wrap = true },
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
      {
        "<leader>t",
        ":lua require('snacks').terminal.toggle('fish')<CR>",
        desc = "Terminal",
      },
      {
        "<Esc>",
        "<ESC>:noh<CR>:lua require('snacks').notifier.hide()<CR>",
        desc = "Dismiss Notifications",
      },
    },
  },
}
