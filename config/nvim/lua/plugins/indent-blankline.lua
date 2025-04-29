return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = function()
      local icons = require "icons"
      return {
        indent = {
          char = icons.indent_line,
          tab_char = icons.indent_line,
        },
        scope = { enabled = false },
        exclude = {
          filetypes = {
            "help",
            "lspinfo",
            "checkhealth",
            "man",
            "neo-tree",
            "lazy",
            "mason",
            "lazyterm",
            "snacks_picker_list",
            "snacks_picker_input",
            "snacks_picker_preview",
          },
        },
      }
    end,
  },
}
