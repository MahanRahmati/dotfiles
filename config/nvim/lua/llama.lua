local M = {}

M.llama_server_config = {
  bin_path = "llama-server",
  port = 8012,
  args = {
    "-hf",
    "unsloth/Qwen2.5-Coder-3B-Instruct-128K-GGUF:Q4_K_M",
    "--port",
    "8012",
    "--ubatch-size",
    "512",
    "--batch-size",
    "1024",
    "--ctx-size",
    "16384",
    "--cache-reuse",
    "256",
    "--jinja",
  },
}

M.is_llama_server_running = function()
  local stdout =
    vim.fn.system("lsof -i :" .. M.llama_server_config.port .. " -t")
  return #stdout > 0
end

M.start_llama_server = function()
  if M.is_llama_server_running() then
    vim.notify("llama-server is already running", vim.log.levels.INFO)
    return
  end

  vim.notify("Starting llama-server...", vim.log.levels.INFO)
  local command = table.concat({ M.llama_server_config.bin_path }, " ")
    .. " "
    .. table.concat(M.llama_server_config.args, " ")

  local job_id = vim.fn.jobstart(command, {
    detach = true,
    on_exit = function(_, exit_code, _)
      if exit_code ~= 0 then
        vim.notify(
          "llama-server exited with code: " .. exit_code,
          vim.log.levels.ERROR
        )
      end
    end,
  })

  if job_id == 0 then
    vim.notify("Failed to start llama-server job.", vim.log.levels.ERROR)
    return
  end

  vim.notify("llama-server started.", vim.log.levels.INFO)
end

M.stop_llama_server = function()
  if not M.is_llama_server_running() then
    vim.notify("llama-server is not running.", vim.log.levels.INFO)
    return
  end

  vim.notify("Stopping llama-server...", vim.log.levels.INFO)
  local pid = vim.fn.system("lsof -i :" .. M.llama_server_config.port .. " -t")
  if pid and #pid > 0 then
    vim.fn.system("kill " .. pid)
    vim.notify("llama-server stopped.", vim.log.levels.INFO)
  else
    vim.notify("Could not find llama-server PID.", vim.log.levels.INFO)
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    M.start_llama_server()
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    M.stop_llama_server()
  end,
})

return M
