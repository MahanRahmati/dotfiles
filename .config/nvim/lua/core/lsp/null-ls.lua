local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  require "notify"("Failed to load null_ls", "error")
  return
end

local code_actions = null_ls.builtins.code_actions

local diagnostics = null_ls.builtins.diagnostics

local formatting = null_ls.builtins.formatting

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    code_actions.gitsigns,
    diagnostics.flake8,
  },
}
