local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  require "notify"("Failed to load illuminate", "error")
  return
end

illuminate.configure {
  filetypes_denylist = {
    "alpha",
    "NvimTree",
  },
}
