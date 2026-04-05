vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    vim.pack.add { "https://github.com/lukas-reineke/indent-blankline.nvim" }
    local icons = require "icons"
    require("ibl").setup {
      indent = {
        char = icons.indent_line,
        tab_char = icons.indent_line,
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "checkhealth",
          "man",
          "neo-tree",
        },
      },
    }
  end,
})
