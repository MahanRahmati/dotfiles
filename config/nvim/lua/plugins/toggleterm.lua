local toggleterm = require("core.import").import "toggleterm"
if toggleterm == nil then
  return
end

toggleterm.setup {
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
  float_opts = {
    border = "curved",
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
}

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new {
  cmd = "lazygit",
  dir = "git_dir",
  direction = "tab",
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
