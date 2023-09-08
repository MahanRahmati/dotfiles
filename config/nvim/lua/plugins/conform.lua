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
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("AutoFormat", { clear = true }),
  pattern = "*",
  callback = function(args)
    require("conform").format(
      { async = true, lsp_fallback = true, bufnr = args.buf },
      function(err)
        if not err then
          vim.api.nvim_buf_call(args.buf, function()
            vim.cmd.update()
          end)
        end
      end
    )
  end,
})
