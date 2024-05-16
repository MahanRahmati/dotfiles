----------------------------------------------------------------------
--                             Options                              --
----------------------------------------------------------------------

-- This option is a list of comma-separated names.
vim.opt.clipboard = "unnamedplus"

-- Number of screen lines to use for the command-line.
vim.opt.cmdheight = 0

-- 'colorcolumn' is a comma-separated list of screen columns that are
-- highlighted with ColorColumn.
vim.opt.colorcolumn = "80"

-- A comma-separated list of options for Insert mode completion.
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
vim.opt.cursorline = true

-- Use the appropriate number of spaces to insert a <Tab>.
vim.opt.expandtab = true

-- File-content encoding for the current buffer.
vim.opt.fileencoding = "utf-8"

-- This is a sequence of letters which describes how automatic formatting is to
-- be done
vim.opt.formatoptions:remove { "c", "r", "o" }

-- This is a list of fonts which will be used for the GUI version of Vim.
vim.opt.guifont = "Hack Nerd Font:h15"

-- Ignore case in search patterns.
vim.opt.ignorecase = true

-- Keywords are used in searching and recognizing with many commands.
vim.opt.iskeyword:append "-"

-- The value of this option influences when the last window will have a status
-- line
vim.opt.laststatus = 0

-- If on, Vim will wrap long lines at a character in 'breakat' rather than at
-- the last character that fits on the screen.
vim.opt.linebreak = true

-- Enables mouse support.
vim.opt.mouse = "a"

-- This option controls the number of lines / columns to scroll by when
-- scrolling with a mouse wheel
vim.opt.mousescroll = "ver:3,hor:0"

-- Print the line number in front of each line.
vim.opt.number = true

-- Minimal number of columns to use for the line number.
-- TODO: Add logic to switch 20 and 4.
vim.opt.numberwidth = 4

-- Maximum number of items to show in the popup menu.
vim.opt.pumheight = 10

-- Show the line number relative to the line with the cursor.
vim.opt.relativenumber = true

-- Show the line and column number of the cursor position, separated by a
-- comma.
vim.opt.ruler = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 999

-- Number of spaces to use for each step of (auto)indent.
vim.opt.shiftwidth = 2

-- This option helps to avoid all the |hit-enter| prompts caused by file
-- messages.
vim.opt.shortmess:append "c"

-- If in Insert, Replace or Visual mode put a message on the last line.
vim.opt.showmode = false

-- Never display the line with tab page labels.
vim.opt.showtabline = 2

-- The minimal number of screen columns to keep to the left and to the right
-- of the cursor if 'nowrap' is set.
vim.opt.sidescrolloff = 8

-- When and how to draw the signcolumn.
vim.opt.signcolumn = "yes"

-- Override the 'ignorecase' option if the search pattern contains upper case
-- characters.
vim.opt.smartcase = true

-- Do smart autoindenting when starting a new line.
vim.opt.smartindent = true

-- When on, splitting a window will put the new window below the current one.
vim.opt.splitbelow = true

-- When on, splitting a window will put the new window right of the current
-- one.
vim.opt.splitright = true

-- Use a swapfile for the buffer.
vim.opt.swapfile = false

-- Number of spaces that a <Tab> in the file counts for.
vim.opt.tabstop = 2

-- Enables 24-bit RGB color in the |TUI|.
vim.opt.termguicolors = true

-- Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.timeoutlen = 100

-- When on, the title of the window will be set to the value of 'titlestring'.
vim.opt.title = true

-- When on, Vim automatically saves undo history to an undo file when
-- writing a buffer to a file, and restores undo history from the same file
-- on buffer read.
vim.opt.undofile = true

-- If this many milliseconds nothing is typed the swap file will be written
-- to disk.
vim.opt.updatetime = 300

-- Allow specified keys that move the cursor left/right to move to the
-- previous/next line when the cursor is on the first/last character in the
-- line.
vim.opt.whichwrap:append "<,>,[,],h,l"

-- This option changes how text is displayed.
vim.opt.wrap = false

-- Make a backup before overwriting a file.
vim.opt.writebackup = false
