local nvim_autopairs = require("core.import").import "nvim-autopairs"
if nvim_autopairs == nil then
  return
end

nvim_autopairs.setup {
  check_ts = true, -- Use treesitter to check for a pair.
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local cmp = require("core.import").import "cmp"
if cmp == nil then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
