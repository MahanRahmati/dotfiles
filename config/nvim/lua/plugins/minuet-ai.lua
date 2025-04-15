return {
  {
    "milanglacier/minuet-ai.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Minuet",
    opts = function()
      return {
        blink = {
          enable_auto_complete = true,
        },
        virtualtext = {
          auto_trigger_ft = { "*" },
        },
        provider = "openai_fim_compatible",
        context_window = 2000,
        context_ratio = 0.5,
        throttle = 1000,
        debounce = 400,
        notify = "error",
        request_timeout = 3, -- Same as Blink timeout
        add_single_line_entry = true,
        n_completions = 1,
        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM",
            name = "Qwen 2.5 Coder",
            end_point = "http://localhost:11434/v1/completions",
            model = "hf.co/bartowski/Qwen2.5-Coder-3B-Instruct-abliterated-GGUF:Q6_K",
            stream = true,
            optional = {
              max_tokens = 256,
              stop = { "\n\n" },
              top_p = 0.9,
            },
          },
        },
      }
    end,
    config = function(_, opts)
      require("minuet").setup(opts)
    end,
  },
}
