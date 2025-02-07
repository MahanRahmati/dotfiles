local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.go = { "goimports", "gofmt", "golines" }
  conform.formatters.golines = {
    prepend_args = { "-m", "80" },
  }
end
