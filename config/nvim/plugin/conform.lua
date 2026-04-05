vim.pack.add { "https://github.com/stevearc/conform.nvim" }

require("conform").setup {
  formatters_by_ft = {
    ["*"] = { "squeeze_blanks" },
  },
  format_after_save = {
    lsp_format = "fallback",
  },
}

vim.keymap.set("n", "<leader>lf", function()
  require("conform").format { async = true }
end, { desc = "Format Buffer" })
