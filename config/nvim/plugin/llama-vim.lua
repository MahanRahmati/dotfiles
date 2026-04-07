vim.g.llama_config = {
  show_info = 0,
  keymap_fim_trigger = "",
  keymap_fim_accept_full = "",
  keymap_fim_accept_line = "",
  keymap_fim_accept_word = "",
  stop_strings = { "\n" },
  endpoint_fim = "http://localhost:11434/infill",
  model_fim = "qwen-2.5-coder-1.5B-Instruct",
}

vim.pack.add { "https://github.com/ggml-org/llama.vim" }

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Disable llama.vim on floating buffers",
  group = vim.api.nvim_create_augroup(
    "disable-llama-on-floating",
    { clear = true }
  ),
  pattern = "*",
  callback = function()
    local is_floating = vim.api.nvim_win_get_config(0).relative ~= ""
    local file_types = {
      "TelescopePrompt",
      "TelescopeResults",
    }
    if is_floating or vim.tbl_contains(file_types, vim.bo.filetype) then
      vim.cmd "LlamaDisable"
    else
      vim.cmd "LlamaEnable"
    end
  end,
})
