return {
  {
    "ggml-org/llama.vim",
    init = function()
      vim.g.llama_config = {
        show_info = 0,
        keymap_trigger = "",
        keymap_accept_full = "",
        keymap_accept_line = "",
        keymap_accept_word = "",
        stop_strings = { "\n" },
      }

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
            "snacks_picker_list",
            "snacks_picker_input",
            "snacks_picker_preview",
          }
          if is_floating or vim.tbl_contains(file_types, vim.bo.filetype) then
            vim.cmd "LlamaDisable"
          else
            vim.cmd "LlamaEnable"
          end
        end,
      })
    end,
  },
}
