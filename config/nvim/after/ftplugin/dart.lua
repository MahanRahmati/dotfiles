local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.dart = { "dart_format" }
  conform.formatters.dart_format = {
    command = "dart",
    args = function(_, ctx)
      return { "format", ctx.filename }
    end,
    stdin = false,
  }
end

enable_treesitter "dart"
