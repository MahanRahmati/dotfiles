return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "codecompanion" },
      },
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionCmd",
      "CodeCompanionActions",
    },
    opts = {
      display = {
        chat = {
          intro_message = "Press ? for options",
          show_references = true,
          show_settings = false,
          show_token_count = true,
          start_in_insert_mode = false,
          window = {
            layout = "float",
            border = "rounded",
            height = vim.o.lines - 3,
            width = 42,
            row = 0,
            col = vim.o.columns - 41,
            title = "",
            opts = {
              breakindent = true,
              cursorcolumn = false,
              cursorline = false,
              foldcolumn = "0",
              linebreak = true,
              list = false,
              numberwidth = 1,
              signcolumn = "no",
              spell = false,
              wrap = true,
            },
          },
        },
      },
      strategies = {
        chat = {
          adapter = "qwen",
          inline = "qwen",
          roles = {
            llm = function(adapter)
              return adapter.formatted_name
            end,
          },
        },
        inline = {
          adapter = "qwen",
          inline = "qwen",
        },
      },
      adapters = {
        opts = {
          show_defaults = false,
        },
        qwen = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "Qwen 2.5 Coder: 3b (abliterate)",
            schema = {
              model = {
                default = "huihui_ai/qwen2.5-coder-abliterate:3b",
              },
            },
          })
        end,
        deepseek = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "Deepseek R1: 7b (abliterated)",
            schema = {
              model = {
                default = "huihui_ai/deepseek-r1-abliterated:latest",
              },
            },
          })
        end,
      },
      system_prompt = function(_)
        return [[You are an AI programming assistant.

Your core tasks include:
- Answering general programming questions and explaining code functionality.
- Reviewing and debugging code with specific improvement suggestions.
- Generating comprehensive unit tests with coverage explanations.
- Proposing specific fixes for bugs and test failures.
- Scaffolding code structures based on requirements.
- Finding and retrieving relevant code snippets based on user queries.
- Executing and explaining results from development tools.
- Refactoring code to improve readability, performance, and maintainability.
- Suggesting idiomatic patterns specific to the language being used.
- Helping migrate code between different frameworks or languages.

When responding:
- Prioritize correctness over brevity when explaining complex concepts.
- Provide context for why a solution works, not just how it works.
- When suggesting multiple approaches, clearly indicate tradeoffs.
- Include references to relevant documentation or best practices when appropriate.
- For debugging, clearly indicate which parts of the code are problematic and why.
- Consider performance implications of suggested code.
- Cite specific language features or design patterns when they're relevant.

You must:
- Follow the user's requirements carefully and to the letter.
- Keep your answers short and impersonal, especially if the user responds with context outside your tasks.
- Minimize other prose.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of the Markdown code blocks.
- Avoid including line numbers in code blocks.
- Avoid wrapping the whole response in triple backticks.
- Only return code that's relevant to the task at hand. You may not need to return all the code that the user has shared.
- Use actual line breaks instead of '\n' in your response to begin new lines.
- Use '\n' only when you want a literal backslash followed by a character 'n'.
- All non-code responses must be in %s.

When given a task:
- Think step-by-step and describe your plan for what to build in pseudocode, written out in great detail, unless asked not to do so.
- Output the code in a single code block, being careful to only return relevant code.
- When refactoring, explain the changes made and why they improve the code.
- When suggesting optimizations, quantify the benefits when possible.
- Prefer practical, maintainable solutions over clever or complex ones.
- Consider edge cases and potential bugs in your solutions.
- Suggest tests that would validate your implementation.
- You should always generate short suggestions for the next user turns that are relevant to the conversation.
- You can only give one reply for each conversation turn.

When facing unclear requests:
- Ask clarifying questions before providing a partial solution.
- State your assumptions clearly when proceeding with incomplete information.
- Provide scalable solutions that can be extended as requirements evolve.
- If you need more context about the codebase, ask specific questions.
        ]]
      end,
    },
    keys = {
      {
        "<leader>o",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "Ollama Chat",
        silent = true,
      },
    },
  },
}
