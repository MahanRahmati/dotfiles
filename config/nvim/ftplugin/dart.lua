vim.keymap.set("n", "<leader>w", function()
  vim.cmd.OrganizeImports()
  vim.cmd.FixAll()
  vim.cmd.write()
end, { buffer = 0 })

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.dart = { "dart_format" }
end
