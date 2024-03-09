return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        opts = {
          detection_methods = { "pattern", "lsp" },
        },
        config = function(_, opts)
          require("project_nvim").setup(opts)
        end,
      },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local actions = require "telescope.actions"
      local icons = require "icons"

      require("telescope").setup {
        defaults = {
          path_display = { "smart" },
          layout_strategy = "flex",
          layout_config = {
            horizontal = {
              height = { padding = 0 },
              width = { padding = 0 },
              preview_cutoff = 1,
              prompt_position = "bottom",
            },
            vertical = {
              height = { padding = 0 },
              width = { padding = 0 },
              preview_cutoff = 1,
              prompt_position = "bottom",
            },
          },
          prompt_prefix = " " .. icons.find .. " ",
          selection_caret = icons.selection_caret,
          file_ignore_patterns = {
            ".git/",
            "%.lock",
            "node_modules/*",
            ".dart_tool/",
            ".github/",
            ".gradle/",
            ".idea/",
            ".vscode/",
            "__pycache__/",
            "build/",
            "env/",
            "gradle/",
            "node_modules/",
            "%.mp4",
            "%.mkv",
            "%.rar",
            "%.zip",
            "%.7z",
            "%.tar",
            "%.bz2",
            "%.tar.gz",
          },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            follow = true,
            hidden = true,
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
          },
        },
        extensions = {},
      }
      require("telescope").load_extension "projects"

      local builtin = require "telescope.builtin"
      local buffers = builtin.buffers
      local find_files = builtin.find_files
      local live_grep = builtin.live_grep
      local help_tags = builtin.help_tags
      local resume = builtin.resume
      local oldfiles = builtin.oldfiles
      local diagnostics = builtin.diagnostics
      local lsp_references = builtin.lsp_references
      local fuzzy_find = builtin.current_buffer_fuzzy_find
      local lsp_definitions = builtin.lsp_definitions
      local lsp_references = builtin.lsp_references
      local lsp_impls = builtin.lsp_implementations

      vim.keymap.set("n", "<leader>b", buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fb", buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>ff", find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", live_grep, { desc = "Find Text" })
      vim.keymap.set("n", "<leader>fh", help_tags, { desc = "Help" })
      vim.keymap.set("n", "<leader>fl", resume, { desc = "Last Search" })
      vim.keymap.set("n", "<leader>fr", oldfiles, { desc = "Recent Files" })
      vim.keymap.set("n", "<leader>ld", diagnostics, { desc = "Diagnostics" })
      vim.keymap.set("n", "<leader>lR", lsp_references, { desc = "References" })
      vim.keymap.set("n", "/", fuzzy_find, { desc = "Fuzzy Find" })
      vim.keymap.set("v", "/", fuzzy_find, { desc = "Fuzzy Find" })
      vim.keymap.set("n", "?", fuzzy_find, { desc = "Fuzzy Find" })
      vim.keymap.set("v", "?", fuzzy_find, { desc = "Fuzzy Find" })
      vim.keymap.set("n", "gd", lsp_definitions, { desc = "Definition" })
      vim.keymap.set("n", "gr", lsp_references, { desc = "References" })
      vim.keymap.set("n", "gI", lsp_impls, { desc = "Implementations" })
    end,
  },
}
