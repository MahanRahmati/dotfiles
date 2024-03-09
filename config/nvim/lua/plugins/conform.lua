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
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}

-- TODO: Add prettier options
-- local util = require "conform.util"
-- local prettier = require "conform.formatters.prettier"
-- require("conform").formatters.prettier =
--   vim.tbl_deep_extend("force", prettier, {
--     args = util.extend_args(
--       prettier.args,
--       { "--no-semi", "--single-quote", "--jsx-single-quote" }
--     ),
--     range_args = util.extend_args(
--       prettier.range_args,
--       { "--no-semi", "--single-quote", "--jsx-single-quote" }
--     ),
--   })
