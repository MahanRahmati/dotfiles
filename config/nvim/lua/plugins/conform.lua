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
        html = { { "prettier" } },
        go = { "goimports", "gofmt" },
        zig = { "zigfmt" },
        ["*"] = { "squeeze_blanks" },
      },
      format_on_save = function(bufnr)
        local slow_filetypes = { dart = true }
        local ft = vim.bo[bufnr].filetype
        local slow = slow_filetypes[ft]
        if slow then
          return { timeout_ms = 2000, lsp_fallback = true }
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      format_after_save = { lsp_fallback = true },
      formatters = {
        prettier = {
          prepend_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        },
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
        mode = "",
        desc = "Format Buffer",
      },
    },
  },
}
