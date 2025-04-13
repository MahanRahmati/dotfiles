local user_command = vim.api.nvim_create_user_command

-- Organize imports
user_command("OrganizeImports", function(_)
  vim.lsp.buf.code_action {
    context = {
      diagnostics = {},
      only = { "source.organizeImports" },
    },
    apply = true,
  }
end, {})

-- Fix all lint errors
user_command("FixAll", function(_)
  vim.lsp.buf.code_action {
    context = {
      diagnostics = {},
      only = { "source.fixAll" },
    },
    apply = true,
  }
end, {})
