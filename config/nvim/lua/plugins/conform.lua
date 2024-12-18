return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
        fish = { "fish_indent" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        sh = { "shfmt" },
        yaml = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        go = { "goimports", "gofmt", "golines" },
        zig = { "zigfmt" },
        php = { "pint" },
        blade = { "blade-formatter" },
        python = { "black" },
        ["*"] = { "squeeze_blanks" },
      },
      format_on_save = function(bufnr)
        local slow_filetypes = { dart = true }
        local ft = vim.bo[bufnr].filetype
        local slow = slow_filetypes[ft]
        if slow then
          return { timeout_ms = 2000, lsp_format = "fallback" }
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      format_after_save = { lsp_format = "fallback" },
      formatters = {
        prettier = {
          prepend_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        },
        golines = {
          prepend_args = { "-m", "80" },
        },
      },
    },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format { async = true, lsp_format = "fallback" }
        end,
        mode = "",
        desc = "Format Buffer",
      },
    },
  },
}
