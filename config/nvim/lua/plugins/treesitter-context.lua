local treesitter_context = require("core.import").import "treesitter-context"
if treesitter_context == nil then
  return
end

treesitter_context.setup {}
