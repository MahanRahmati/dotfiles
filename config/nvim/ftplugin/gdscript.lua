vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0

local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.gdscript = { "gdformat" }
end

local mason_ok, _ = pcall(require, "mason")
if mason_ok then
  local ok, mason_tool_installer = pcall(require, "mason-tool-installer")
  if ok then
    mason_tool_installer.setup {
      ensure_installed = {
        "gdtoolkit",
      },
    }
    vim.cmd "MasonToolsInstall"
  end
end

local treesitter_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if treesitter_ok then
  if not parsers.has_parser "gdscript" then
    vim.cmd "TSInstall gdscript"
  end
end
