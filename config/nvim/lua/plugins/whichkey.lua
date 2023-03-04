local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("Failed to load which-key", "error")
  return
end

which_key.setup {
  spelling = {
    enabled = true,
  },
  window = {
    border = "rounded",
  },
  layout = {
    align = "center",
  },
}

local n_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local n_mappings = {
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  e = { "<cmd>Telescope file_browser path=%:p:h<cr>", "Explorer" },
  v = { "<cmd>vsplit<cr>", "vsplit" },
  h = { "<cmd>split<cr>", "split" },
  w = { "<cmd>w<CR>", "Write" },
  q = { "<cmd>q<CR>", "Quit" },
  ["/"] = {
    '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',
    "Comment",
  },
  c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  C = {
    name = "Comment Frame",
    f = {
      "<cmd>lua require('nvim-comment-frame').add_comment()<cr>",
      "Single line comment",
    },
    m = {
      "<cmd>lua require('nvim-comment-frame').add_multiline_comment()<cr>",
      "Multiline comment",
    },
  },
  p = {
    name = "Package Manager",
    c = { "<cmd>Lazy check<cr>", "Check for updates" },
    d = { "<cmd>Lazy debug<cr>", "Debug" },
    i = { "<cmd>Lazy install<cr>", "Install" },
    l = { "<cmd>Lazy log<cr>", "Log" },
    p = { "<cmd>Lazy profile<cr>", "Profile" },
    r = { "<cmd>Lazy restore<cr>", "Restore" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    u = { "<cmd>Lazy update<cr>", "Update" },
    x = { "<cmd>Lazy clean<cr>", "Clean" },
  },
  f = {
    name = "Find",
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlights" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    w = { "<cmd>Telescope grep_string<cr>", "Word" },
    t = { "<cmd>TodoTelescope<cr>", "Todos" },
  },
  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>GitBlameToggle<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    h = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
    m = { "<cmd>Mason<cr>", "Mason" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
      "Prev Diagnostic",
    },
    v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    o = { "<cmd>SymbolsOutline<cr>", "Outline" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    R = { "<cmd>Telescope lsp_references<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
  },
  t = {
    name = "Terminal",
    ["1"] = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Horizontal" },
    ["2"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    ["3"] = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  u = { "<cmd>Telescope undo<cr>", "Undo" },
}

local v_opts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local v_mappings = {
  ["/"] = {
    '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
    "Comment",
  },
}

local normal_opts = {
  mode = "n",
  prefix = nil,
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local visual_opts = {
  mode = "v",
  prefix = nil,
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local normal_mappings = {
  ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy Find" },
  ["?"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy Find" },
  K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
  g = {
    d = { "<cmd>Telescope lsp_definitions<cr>", "Definition" },
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    I = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
  },
  s = {
    ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>",
    "Replace current word",
  },
  ["<C-h>"] = { "<C-w>h", "Better window navigation" },
  ["<C-j>"] = { "<C-w>j", "Better window navigation" },
  ["<C-k>"] = { "<C-w>k", "Better window navigation" },
  ["<C-l>"] = { "<C-w>l", "Better window navigation" },
  ["<C-Up>"] = { ":resize -2<cr>", "Resize with arrows" },
  ["<C-Down>"] = { ":resize +2<cr>", "Resize with arrows" },
  ["<C-Left>"] = { ":vertical resize -2<cr>", "Resize with arrows" },
  ["<C-Right>"] = { ":vertical resize -2<cr>", "Resize with arrows" },
}

local visual_mappings = {
  ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy Find" },
  ["?"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy Find" },
  J = { ":m '>+1<CR>gv=gv", "Move Line" },
  K = { ":m '<-2<CR>gv=gv", "Move Line" },
}

local center_mappings = {
  h = { "hzz", "Left" },
  j = { "jzz", "Down" },
  k = { "kzz", "Up" },
  l = { "lzz", "Right" },
  w = { "wzz", "Next word" },
  W = { "Wzz", "Center Cursor" },
  b = { "bzz", "Previous word" },
  B = { "Bzz", "Center Cursor" },
  e = { "ezz", "Next end of word" },
  E = { "Ezz", "Center Cursor" },
  ["<Left>"] = { "<Left>zz", "Left" },
  ["<Down>"] = { "<Down>zz", "Down" },
  ["<Up>"] = { "<Up>zz", "Up" },
  ["<Right>"] = { "<Right>zz", "Right" },
  ["<C-d>"] = { "<C-d>zz", "Center Cursor" },
  ["<C-u>"] = { "<C-u>zz", "Center Cursor" },
  ["$"] = { "$zz", "End of line" },
  ["%"] = { "%zz", "Matching character: '()', '{}', ' ..." },
  ["0"] = { "0zz", "Start of line" },
  G = { "Gzz", "Last line" },
  ["^"] = { "^zz", "Start of line (non-blank)" },
  ["{"] = { "{zz", "Previous empty line" },
  ["}"] = { "}zz", "Next empty line" },
  ["<Enter>"] = { "<Enter>zz", "Center Cursor" },
  ["<BS>"] = { "<BS>zz", "Center Cursor" },
  ["<ESC>"] = { "<ESC>zz", "Center Cursor" },
}

which_key.register(n_mappings, n_opts)
which_key.register(v_mappings, v_opts)
which_key.register(normal_mappings, normal_opts)
which_key.register(visual_mappings, visual_opts)
which_key.register(center_mappings, normal_opts)
which_key.register(center_mappings, visual_opts)
