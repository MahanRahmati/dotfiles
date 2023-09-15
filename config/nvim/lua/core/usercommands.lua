-- Organize imports
vim.api.nvim_create_user_command("OrganizeImports", function(_)
  vim.lsp.buf.code_action {
    context = { only = { "source.organizeImports" } },
    apply = true,
  }
end, {})

-- Fix all lint errors
vim.api.nvim_create_user_command("FixAll", function(_)
  vim.lsp.buf.code_action {
    context = { only = { "source.fixAll" } },
    apply = true,
  }
end, {})
