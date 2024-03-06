----------------------------------------------------------------------
--                             Keymaps                              --
----------------------------------------------------------------------

local set = vim.keymap.set

-- Write
set("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite" })

-- Quit
set("n", "<leader>q", "<cmd>q<CR>", { desc = "[Q]uit" })

-- Vertical Split
set("n", "<leader>v", "<cmd>vsplit<CR>", { desc = "[V]ertical Split" })

-- Horizontal Split
set("n", "<leader>h", "<cmd>split<CR>", { desc = "[H]orizontal Split" })

-- Make split navigation easier.
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
