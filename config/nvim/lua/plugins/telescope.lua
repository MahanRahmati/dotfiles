return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        opts = {
          detection_methods = { "pattern", "lsp" },
          patterns = {
            ".git",
            "_darcs",
            ".hg",
            ".bzr",
            ".svn",
            "Makefile",
            "package.json",
            "lazy-lock.json",
          },
        },
        config = function(_, opts)
          require("project_nvim").setup(opts)
        end,
      },
      "nvim-tree/nvim-web-devicons",
      {
        "barrett-ruth/telescope-http.nvim",
        commit = "c24a43883a0f2c6f244ed1ecf5b66fdb9821a7ea",
      },
      "benfowler/telescope-luasnip.nvim",
    },
    cmd = "Telescope",
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
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--follow",
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

      pcall(require("telescope").load_extension, "projects")
      pcall(require("telescope").load_extension, "http")
      pcall(require("telescope").load_extension, "luasnip")
    end,
    keys = {
      { "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
      { "<leader>fl", "<cmd>Telescope resume<CR>", desc = "Last Search" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
      { "<leader>fH", "<cmd>Telescope http list<CR>", desc = "Http Requests" },
      { "<leader>fs", "<cmd>Telescope luasnip<CR>", desc = "Snippets" },
      { "/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find" },
      {
        "/",
        "<cmd>Telescope current_buffer_fuzzy_find<CR>",
        mode = "v",
        desc = "Find",
      },
      { "?", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Find" },
      {
        "?",
        "<cmd>Telescope current_buffer_fuzzy_find<CR>",
        mode = "v",
        desc = "Find",
      },
    },
  },
}
