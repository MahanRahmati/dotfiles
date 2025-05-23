return {
  {
    "echasnovski/mini.clue",
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local miniclue = require "mini.clue"
      miniclue.setup {
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          { mode = "n", keys = "<leader>f", desc = "Finder" },
          { mode = "n", keys = "<leader>F", desc = "Flutter" },
          { mode = "n", keys = "<leader>g", desc = "Git" },
          { mode = "n", keys = "<leader>l", desc = "LSP" },
          { mode = "n", keys = "<leader>p", desc = "Package Manager" },
        },
        window = {
          -- Floating window config
          config = {
            border = "rounded",
            title = { { "", "MiniClueBorder" } },
          },

          -- Delay before showing clue window
          delay = 100,

          -- Keys to scroll inside the clue window
          scroll_down = "<C-d>",
          scroll_up = "<C-u>",
        },
      }
    end,
  },
}
