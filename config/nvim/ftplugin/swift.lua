local conform_ok, conform = pcall(require, "conform")
if conform_ok then
  conform.formatters_by_ft.swift = { "swift_format" }
  conform.formatters.swift_format = {
    command = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift-format",
  }
end

local treesitter_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if treesitter_ok then
  if not parsers.has_parser "swift" then
    vim.cmd "TSInstall swift"
  end
end
