vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
    end

    map("gD", vim.lsp.buf.declaration, "Declaration")
    map("<leader>l", "", "LSP")
    map("<leader>lr", vim.lsp.buf.rename, "Rename")
    map("<leader>la", vim.lsp.buf.code_action, "Code Action")
    map("<leader>a", vim.lsp.buf.code_action, "Code Action")
    map("<leader>li", "<cmd>checkhealth vim.lsp<CR>", "Info")
    map("K", function()
      vim.lsp.buf.hover { border = "rounded" }
    end, "Hover Documentation")
  end,
})

vim.lsp.enable {
  "lua_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "gopls",
  "zls",
  "marksman",
  "harper_ls",
  "sqls",
  "sourcekit",
  "ty",
}
