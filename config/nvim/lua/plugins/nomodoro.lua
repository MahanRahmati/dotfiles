local nomodoro = require("core.import").import "nomodoro"
if nomodoro == nil then
  return
end

nomodoro.setup {
  work_time = 25,
  break_time = 5,
  menu_available = true,
  texts = {
    on_break_complete = "TIME IS UP!",
    on_work_complete = "TIME IS UP!",
    status_icon = "",
    timer_format = "!%0M:%0S",
  },
  on_work_complete = function()
    vim.notify("Time for a break!", vim.log.levels.ERROR)
  end,
  on_break_complete = function()
    vim.notify("Go back to work!", vim.log.levels.ERROR)
  end,
}

-- Enable nomodoro on vim enter.
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.cmd "NomoWork"
  end,
})
