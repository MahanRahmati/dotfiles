local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.python = {
    "ruff_fix",
    "ruff_organize_imports",
    "ruff_format",
  }
end

enable_treesitter "python"
