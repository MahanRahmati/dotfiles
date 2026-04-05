local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.rust = { "rustfmt" }
end

enable_treesitter "rust"
