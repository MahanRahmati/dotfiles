vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    vim.pack.add { "https://github.com/lewis6991/gitsigns.nvim" }
    local icons = require "icons"
    require("gitsigns").setup {
      signs = {
        add = { text = icons.gitsigns.add },
        change = { text = icons.gitsigns.change },
        delete = { text = icons.gitsigns.delete },
        topdelete = { text = icons.gitsigns.topdelete },
        changedelete = { text = icons.gitsigns.changedelete },
        untracked = { text = icons.gitsigns.untracked },
      },
      signs_staged = {
        add = { text = icons.gitsigns.add },
        change = { text = icons.gitsigns.change },
        delete = { text = icons.gitsigns.delete },
        topdelete = { text = icons.gitsigns.topdelete },
        changedelete = { text = icons.gitsigns.changedelete },
        untracked = { text = icons.gitsigns.untracked },
      },
      current_line_blame = true,
    }
  end,
})
