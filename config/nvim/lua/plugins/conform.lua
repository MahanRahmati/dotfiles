require("conform").setup {
  formatters_by_ft = {
    dart = { "dart_format" },
    fish = { "fish_indent" },
    go = { "gofumpt" },
    json = { { "prettier" } },
    lua = { "stylua" },
    markdown = { { "prettier" } },
    sh = { "shfmt" },
    yaml = { { "prettier" } },
    css = { { "prettier" } },
    ["*"] = { "squeeze_blanks" },
  },
}

local util = require "conform.util"
local prettier = require "conform.formatters.prettier"
require("conform").formatters.prettier =
  vim.tbl_deep_extend("force", prettier, {
    args = util.extend_args(
      prettier.args,
      { "--no-semi", "--single-quote", "--jsx-single-quote" }
    ),
    range_args = util.extend_args(
      prettier.range_args,
      { "--no-semi", "--single-quote", "--jsx-single-quote" }
    ),
  })

-- Auto format
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("AutoFormat", { clear = true }),
  pattern = "*",
  callback = function(args)
    require("conform").format {
      timeout_ms = 2000,
      lsp_fallback = true,
      buf = args.buf,
    }
  end,
})

-- Format command
vim.api.nvim_create_user_command("Format", function(args)
  require("conform").format {
    timeout_ms = 2000,
    lsp_fallback = true,
    buf = args.buf,
  }
end, {})
