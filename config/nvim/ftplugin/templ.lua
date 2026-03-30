local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.templ = { "templ" }
end

local treesitter_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if treesitter_ok then
  if not parsers.has_parser "templ" then
    vim.cmd "TSInstall templ"
  end
end
