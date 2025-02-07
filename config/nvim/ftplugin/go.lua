local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.go = { "goimports", "gofmt", "golines" }
  conform.formatters.golines = {
    prepend_args = { "-m", "80" },
  }
end

local mason_ok, _ = pcall(require, "mason")
if mason_ok then
  local mason_tool_installer_ok, mason_tool_installer =
    pcall(require, "mason-tool-installer")
  if mason_tool_installer_ok then
    mason_tool_installer.setup {
      ensure_installed = {
        "goimports",
        "golines",
        "gopls",
      },
    }
    vim.cmd "MasonToolsInstall"
  end
end
