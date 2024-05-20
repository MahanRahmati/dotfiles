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

      local Terminal = require("toggleterm.terminal").Terminal

      local lazygit = Terminal:new {
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
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
          height = function()
            return vim.o.lines - 3
          end,
        },
        on_open = function(_)
          vim.cmd "startinsert!"
        end,
        on_close = function(_)
          vim.cmd "startinsert!"
        end,
      }

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end
    end,
    keys = {
      { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "LazyGit" },
      { "<leader>t", "<cmd>ToggleTerm<CR>", desc = "Terminal" },
    },
  },
}
