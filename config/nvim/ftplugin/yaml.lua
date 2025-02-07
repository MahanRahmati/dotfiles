local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.yaml = { "prettier" }
  conform.formatters.prettier = {
    prepend_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
  }
end
