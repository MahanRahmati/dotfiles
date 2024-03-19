return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
        fish = { "fish_indent" },
        json = { { "prettier" } },
        lua = { "stylua" },
        markdown = { { "prettier" } },
        sh = { "shfmt" },
        yaml = { { "prettier" } },
        css = { { "prettier" } },
        ["*"] = { "squeeze_blanks" },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      formatters = {
        prettier = {
          prepend_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
