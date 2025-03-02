vim.keymap.set("n", "<leader>w", function()
  vim.cmd.OrganizeImports()
  vim.cmd.FixAll()
  vim.cmd.write()
end, { buffer = 0 })

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.dart = { "dart_format" }
  conform.formatters.dart_format = {
    command = "dart",
    args = function(_, ctx)
      return { "format", ctx.filename }
    end,
    stdin = false,
  }
end

local treesitter_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if treesitter_ok then
  if not parsers.has_parser "dart" then
    vim.cmd "TSInstall dart"
  end
end
