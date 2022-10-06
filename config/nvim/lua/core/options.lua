local options = {

  -- This option is a list of comma-separated names.
  clipboard = "unnamedplus",

  -- Number of screen lines to use for the command-line.
  cmdheight = 0,

  -- 'colorcolumn' is a comma-separated list of screen columns that are
  -- highlighted with ColorColumn.
  colorcolumn = "80",

  -- A comma-separated list of options for Insert mode completion.
  completeopt = { "menuone", "noselect" },

  -- Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
  cursorline = true,

  -- Use the appropriate number of spaces to insert a <Tab>.
  expandtab = true,

  -- File-content encoding for the current buffer.
  fileencoding = "utf-8",

  -- This is a list of fonts which will be used for the GUI version of Vim.
  guifont = "Hack Nerd Font:h15",

  -- Ignore case in search patterns.
  ignorecase = true,

  -- Enables mouse support.
  mouse = "a",

  -- Print the line number in front of each line.
  number = true,

  -- Maximum number of items to show in the popup menu.
  pumheight = 10,

  -- Show the line number relative to the line with the cursor.
  relativenumber = true,

  -- Minimal number of screen lines to keep above and below the cursor.
  scrolloff = 999,

  -- Number of spaces to use for each step of (auto)indent.
  shiftwidth = 2,

  -- If in Insert, Replace or Visual mode put a message on the last line.
  showmode = false,

  -- Always display the line with tab page labels.
  showtabline = 2,

  -- The minimal number of screen columns to keep to the left and to the right
  -- of the cursor if 'nowrap' is set.
  sidescrolloff = 8,

  -- When and how to draw the signcolumn.
  signcolumn = "yes",

  -- Override the 'ignorecase' option if the search pattern contains upper case
  -- characters.
  smartcase = true,

  -- Do smart autoindenting when starting a new line.
  smartindent = true,

  -- When on, splitting a window will put the new window below the current one.
  splitbelow = true,

  -- When on, splitting a window will put the new window right of the current
  -- one.
  splitright = true,

  -- Use a swapfile for the buffer.
  swapfile = false,

  -- Number of spaces that a <Tab> in the file counts for.
  tabstop = 2,

  -- Enables 24-bit RGB color in the |TUI|.
  termguicolors = true,

  -- Time in milliseconds to wait for a mapped sequence to complete.
  timeoutlen = 100,

  -- When on, the title of the window will be set to the value of
  -- 'titlestring'.
  title = true,

  -- When on, Vim automatically saves undo history to an undo file when
  -- writing a buffer to a file, and restores undo history from the same file
  -- on buffer read.
  undofile = true,

  -- If this many milliseconds nothing is typed the swap file will be written
  -- to disk.
  updatetime = 300,

  -- This option changes how text is displayed.
  wrap = false,

  -- Make a backup before overwriting a file.
  writebackup = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Keywords are used in searching and recognizing with many commands.
vim.opt.iskeyword:append "-"

-- This option helps to avoid all the |hit-enter| prompts caused by file
-- messages.
vim.opt.shortmess:append "c"

-- Allow specified keys that move the cursor left/right to move to the
-- previous/next line when the cursor is on the first/last character in the
-- line.
vim.opt.whichwrap:append "<,>,[,],h,l"
