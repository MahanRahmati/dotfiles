vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    vim.pack.add { "https://github.com/lukas-reineke/virt-column.nvim" }
    local icons = require "icons"
    require("virt-column").setup {
      char = icons.virt_line,
      highlight = "ErrorMsg",
    }
  end,
})
