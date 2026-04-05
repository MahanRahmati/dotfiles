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
    map("K", vim.lsp.buf.hover, "Hover Documentation")
  end,
})

local enable_lsp = function(name)
  vim.lsp.enable(name)
  vim.lsp.config(name, {})
end

enable_lsp "bashls"
enable_lsp "gopls"
enable_lsp "harper_ls"
enable_lsp "jsonls"
enable_lsp "lua_ls"
enable_lsp "marksman"
enable_lsp "rust_analyzer"
enable_lsp "templ"
enable_lsp "ty"
enable_lsp "yamlls"
enable_lsp "zls"
