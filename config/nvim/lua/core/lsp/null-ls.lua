local null_ls = require("core.import").import "null-ls"
if null_ls == nil then
  return
end

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  debug = false,
  sources = {

    -- JSON YAML Markdown
    formatting.prettier.with {
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },

    -- Lua
    formatting.stylua,

    -- Gitsigns
    code_actions.gitsigns,

    -- Fish
    diagnostics.fish,
    formatting.fish_indent,

    -- Bash
    code_actions.shellcheck,
    formatting.shfmt,
  },
}

local mason_null_ls = require("core.import").import "mason-null-ls"
if mason_null_ls == nil then
  return
end

mason_null_ls.setup {
  ensure_installed = {
    "prettier",
    "stylua",
    "fish",
    "shellcheck",
    "shfmt",
  },
}
