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
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
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
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  f = {
    name = "Find",
    a = { "<cmd>Telescope aerial<cr>", "Aerial" },
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
    w = { "<cmd>Telescope grep_string<cr>", "Search Current Word" },
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
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
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
    ["1"] = { ":1ToggleTerm<cr>", "1" },
    ["2"] = { ":2ToggleTerm<cr>", "2" },
    ["3"] = { ":3ToggleTerm<cr>", "3" },
    ["4"] = { ":4ToggleTerm<cr>", "4" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  u = { "<cmd>Telescope undo<cr>", "Undo" },
  s = {
    ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left><Left>",
    "Replace current word",
  },
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

local lsp_opts = {
  mode = "n",
  prefix = nil,
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local lsp_mappings = {
  K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
  g = {
    d = { "<cmd>Telescope lsp_definitions<cr>", "Definition" },
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
    l = { "<cmd>lua vim.diagnostics.open_float()<cr>", "Open Float" },
  },
}

local search_normal_opts = {
  mode = "n",
  prefix = nil,
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local search_visual_opts = {
  mode = "v",
  prefix = nil,
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local search_mappings = {
  ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy Find" },
  ["?"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy Find" },
}

which_key.register(n_mappings, n_opts)
which_key.register(v_mappings, v_opts)
which_key.register(lsp_mappings, lsp_opts)
which_key.register(search_mappings, search_normal_opts)
which_key.register(search_mappings, search_visual_opts)
