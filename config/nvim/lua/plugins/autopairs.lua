local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("Failed to load nvim-autopairs", vim.log.levels.ERROR)
  return
end

npairs.setup {
  check_ts = true, -- Use treesitter to check for a pair.
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  vim.notify("Failed to load cmp", vim.log.levels.ERROR)
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
