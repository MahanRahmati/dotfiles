return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
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
