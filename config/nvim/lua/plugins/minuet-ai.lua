return {
  {
    "milanglacier/minuet-ai.nvim",
    opts = function()
      return {
        provider = "openai_fim_compatible",
        n_completions = 1,
        context_window = 8192,
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
