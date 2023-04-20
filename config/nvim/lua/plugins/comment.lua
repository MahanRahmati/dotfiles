local comment = require("core.import").import "Comment"
if comment == nil then
  return
end

comment.setup {
  ignore = "^$", -- Ignores empty lines
}
