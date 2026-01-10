local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.python = {
    "ruff_fix",
    "ruff_organize_imports",
    "ruff_format",
  }
end

local mason_ok, _ = pcall(require, "mason")
if mason_ok then
  local ok, mason_tool_installer = pcall(require, "mason-tool-installer")
  if ok then
    mason_tool_installer.setup {
      ensure_installed = {
        "ruff",
      },
    }
    vim.cmd "MasonToolsInstall"
  end
end
