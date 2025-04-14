local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.sh = { "shfmt" }
end

local mason_ok, _ = pcall(require, "mason")
if mason_ok then
  local ok, mason_tool_installer = pcall(require, "mason-tool-installer")
  if ok then
    mason_tool_installer.setup {
      ensure_installed = {
        "shfmt",
        "bash-language-server",
      },
    }
    vim.cmd "MasonToolsInstall"
  end
end

local treesitter_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if treesitter_ok then
  if not parsers.has_parser "bash" then
    vim.cmd "TSInstall bash"
  end
end
