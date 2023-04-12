local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("Failed to load null_ls", vim.log.levels.ERROR)
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

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
  vim.notify("Failed to load mason-null-ls", vim.log.levels.ERROR)
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
