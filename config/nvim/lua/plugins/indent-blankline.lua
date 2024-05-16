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
            "alpha",
            "checkhealth",
            "dashboard",
            "man",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
            "TelescopePrompt",
            "TelescopeResults",
          },
        },
      }
    end,
  },
}
