return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spelling = { enabled = true },
      window = {
        border = "rounded",
      },
      layout = {
        align = "center",
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)

      -- Document existing key chains
      require("which-key").register {
        ["<leader>C"] = { name = "Comment Frame", _ = "which_key_ignore" },
        ["<leader>Cs"] = { name = "Comment Singleline", _ = "which_key_ignore" },
        ["<leader>Cm"] = { name = "Comment Multiline", _ = "which_key_ignore" },
        ["<leader>f"] = { name = "Finder", _ = "which_key_ignore" },
        ["<leader>g"] = { name = "Git", _ = "which_key_ignore" },
        ["<leader>l"] = { name = "LSP", _ = "which_key_ignore" },
        ["<leader>p"] = { name = "Package Manager", _ = "which_key_ignore" },
      }
    end,
  },
}

-- local n_mappings = {
--   a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--   ["/"] = { "<cmd>norm gcc<CR>", "Comment" },
--   c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
--   C = {
--     name = "Cody",
--     c = { "<cmd>CodyToggle<cr>", "Cody Toggle" },
--     h = {
--       '<cmd>lua require("sg.cody.commands").focus_history()<cr>',
--       "Cody Focus History",
--     },
--     p = {
--       '<cmd>lua require("sg.cody.commands").focus_prompt()<cr>',
--       "Cody Focus Prompt",
--     },
--   },
--   l = {
--     name = "LSP",
--     a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--     f = { "<cmd>lua require 'conform'.format()<cr>", "Format" },
--     F = { "<cmd>FixAll<cr>", "Fix All" },
--     i = { "<cmd>LspInfo<cr>", "Info" },
--     h = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
--     m = { "<cmd>Mason<cr>", "Mason" },
--     j = {
--       "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
--       "Next Diagnostic",
--     },
--     k = {
--       "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
--       "Prev Diagnostic",
--     },
--     v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
--     l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--     o = { "<cmd>OrganizeImports<cr>", "Organize Imports" },
--     q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
--     r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--   },
-- }

-- local v_mappings = {
--   ["/"] = { "<cmd>norm gc<CR>", "Comment" },
--   d = { ":CodyAsk Generate code documentation<cr>", "Cody Doc" },
--   e = { ":CodyAsk Explain code<cr>", "Cody Explain" },
--   t = { ":CodyAsk Generate unit tests<cr>", "Cody Test" },
--   s = { ":CodyAsk Find code smells<cr>", "Cody Smell" },
-- }

-- local normal_mappings = {
--   K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
--   g = {
--     D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
--   },
--   s = {
--     ":%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>",
--     "Replace current word",
--   },
--   ["<C-Up>"] = { ":resize -2<cr>", "Resize with arrows" },
--   ["<C-Down>"] = { ":resize +2<cr>", "Resize with arrows" },
--   ["<C-Left>"] = { ":vertical resize -2<cr>", "Resize with arrows" },
--   ["<C-Right>"] = { ":vertical resize -2<cr>", "Resize with arrows" },
-- }

-- local visual_mappings = {
--   J = { ":m '>+1<CR>gv=gv", "Move Line" },
--   K = { ":m '<-2<CR>gv=gv", "Move Line" },
-- }
