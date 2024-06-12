local set = vim.keymap.set

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Write
set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })

-- Quit
set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Vertical Split
set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "Vertical Split" })

-- Horizontal Split
set("n", "<leader>h", "<cmd>split<CR>", { desc = "Horizontal Split" })

-- Make split navigation easier.
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Replace current word
set(
  "n",
  "<leader>s",
  ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>",
  { desc = "Replace current word" }
)

-- Comment
set("n", "<leader>/", "<cmd>norm gcc<CR>", { desc = "Comment" })
set("v", "<leader>/", "<cmd>norm gc<CR>", { desc = "Comment" })

-- Smart deletion
vim.keymap.set("n", "dd", function()
  if vim.api.nvim_get_current_line():match "^%s*$" then
    return '"_dd'
  else
    return "dd"
  end
end, { noremap = true, expr = true })
