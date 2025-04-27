return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    opts = {
      size = 15,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      highlights = {
        FloatBorder = {
          link = "FloatBorder",
        },
      },
      float_opts = {
        border = "rounded",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
        width = function(_term)
          _term.float_opts.col = vim.o.columns
          return vim.o.columns
        end,
        height = function(_term)
          local height = 15
          _term.float_opts.row = vim.o.lines - height - 3
          return height
        end,
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
    end,
    keys = {
      { "<leader>t", "<cmd>ToggleTerm<CR>", desc = "Terminal" },
    },
  },
}
