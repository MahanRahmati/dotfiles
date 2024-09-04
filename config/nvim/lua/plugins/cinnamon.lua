return {
  {
    "declancm/cinnamon.nvim",
    opts = {},
    keys = {
      { "n", ":lua require('cinnamon').scroll('n')<CR>" },
      { "N", ":lua require('cinnamon').scroll('N')<CR>" },
      { "*", ":lua require('cinnamon').scroll('*')<CR>" },
      { "0", ":lua require('cinnamon').scroll('0')<CR>" },
      { "_", ":lua require('cinnamon').scroll('_')<CR>" },
      { "^", ":lua require('cinnamon').scroll('^')<CR>" },
      { "$", ":lua require('cinnamon').scroll('$')<CR>" },
      -- { "gg", ":lua require('cinnamon').scroll('gg')<CR>" },
      -- { "G", ":lua require('cinnamon').scroll('G')<CR>" },
      { "<ScrollWheelUp>", "<C-y>", desc = "Scroll Wheel Up" },
      { "<ScrollWheelDown>", "<C-e>", desc = "Scroll Wheel Down" },
    },
  },
}
