local M = {}

local send_message = function(message)
  local status_ok, notify = pcall(require, "notify")
  if status_ok then
    notify(message, vim.log.levels.ERROR)
  else
    vim.api.nvim_err_writeln(message)
  end
end

M.import = function(plugin)
  local status_ok, p = pcall(require, plugin)
  if not status_ok then
    local message = "Failed to load " .. plugin
    send_message(message)
    return nil
  end
  return p
end

return M
