return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionCmd",
      "CodeCompanionActions",
    },
    opts = function()
      local icons = require "icons"
      return {
        display = {
          chat = {
            intro_message = "Press ? for options",
            show_header_separator = true,
            show_references = true,
            show_token_count = true,
            show_tools_processing = true,
            start_in_insert_mode = false,
            icons = icons.codecompanion,
            window = {
              layout = "float",
              border = "rounded",
              height = vim.o.lines - 3,
              width = 52,
              row = 0,
              col = vim.o.columns - 51,
              title = "",
              opts = {
                breakindent = true,
                cursorcolumn = false,
                cursorline = false,
                foldcolumn = "0",
                linebreak = true,
                list = true,
                numberwidth = 1,
                signcolumn = "no",
                spell = false,
                wrap = true,
                number = false,
                relativenumber = false,
              },
            },
          },
        },
        strategies = {
          chat = {
            adapter = "qwen_3_instruct",
            inline = "qwen_3_instruct",
            roles = {
              llm = function(adapter)
                return icons.copilot .. " " .. adapter.formatted_name
              end,
              user = icons.person .. " " .. "Me",
            },
          },
          inline = {
            adapter = "qwen_3_instruct",
            inline = "qwen_3_instruct",
          },
          cmd = {
            adapter = "qwen_3_instruct",
          },
        },
        adapters = {
          acp = {
            opts = {
              show_defaults = false,
            },
          },
          http = {
            opts = {
              show_defaults = false,
            },
            qwen_3_instruct = function()
              return require("codecompanion.adapters").extend(
                "openai_compatible",
                {
                  name = "Qwen 3 4B Instruct 2507",
                  formatted_name = "Qwen 3 4B Instruct 2507",
                  env = {
                    url = "http://127.0.0.1:11434",
                  },
                  schema = {
                    model = {
                      default = "qwen-3-4B-instruct-2507",
                    },
                  },
                }
              )
            end,
            qwen_3_thinking = function()
              return require("codecompanion.adapters").extend(
                "openai_compatible",
                {
                  name = "Qwen 3 4B Thinking 2507",
                  formatted_name = "Qwen 3 4B Thinking 2507",
                  env = {
                    url = "http://127.0.0.1:11434",
                  },
                  schema = {
                    model = {
                      default = "qwen-3-4B-thinking-2507",
                    },
                  },
                }
              )
            end,
            gemma3 = function()
              return require("codecompanion.adapters").extend(
                "openai_compatible",
                {
                  name = "Gemma 3 4B",
                  formatted_name = "Gemma 3 4B",
                  env = {
                    url = "http://127.0.0.1:11434",
                  },
                  schema = {
                    model = {
                      default = "gemma-3-4b",
                    },
                  },
                }
              )
            end,
          },
        },
      }
    end,
    keys = {
      {
        "<leader>o",
        "<cmd>CodeCompanionChat Toggle<cr>",
        desc = "Open LLM Chat",
        silent = true,
      },
    },
  },
}
