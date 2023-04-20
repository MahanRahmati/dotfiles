local notify = require("core.import").import "notify"
if notify == nil then
  return
end

vim.notify = notify

print = function(...)
  local print_safe_args = {}
  local _ = { ... }
  for i = 1, #_ do
    table.insert(print_safe_args, tostring(_[i]))
  end
  notify(table.concat(print_safe_args, " "), "info")
end

notify.setup {
  background_colour = "#000000",
  render = "minimal",
}

vim.keymap.set(
  "",
  "<Esc>",
  "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>",
  { silent = true }
)
