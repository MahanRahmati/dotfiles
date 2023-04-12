local status_ok, nomodoro = pcall(require, "nomodoro")
if not status_ok then
  vim.notify("Failed to load nomodoro", vim.log.levels.ERROR)
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
