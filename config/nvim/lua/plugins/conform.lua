local conform = require("core.import").import "conform"
if conform == nil then
  return
end

conform.setup {
  formatters_by_ft = {
    lua = { "stylua" },
    sh = { "shfmt" },
    dart = { "dart_format" },
    go = { "gofumpt" },
    fish = { "fish_indent" },
  },
}

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
