local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  vim.notify("Failed to load illuminate", vim.log.levels.ERROR)
  return
end

illuminate.configure {
  filetypes_denylist = {
    "alpha",
    "lazy",
    "mason",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
  },
}
