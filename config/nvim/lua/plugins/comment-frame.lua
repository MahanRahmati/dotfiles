local comment_frame = require("core.import").import "nvim-comment-frame"
if comment_frame == nil then
  return
end

comment_frame.setup {}
