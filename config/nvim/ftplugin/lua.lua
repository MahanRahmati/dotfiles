local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.lua = { "stylua" }
end
