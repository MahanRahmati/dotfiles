local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.markdown = { "prettier" }
  conform.formatters.prettier = {
    prepend_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
  }
end
