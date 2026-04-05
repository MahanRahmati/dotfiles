vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if
      name == "telescope-fzf-native.nvim"
      and (kind == "install" or kind == "update")
    then
      vim.system({ "make" }, { cwd = ev.data.path }):wait()
    end
  end,
})

vim.pack.add {
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
}

local icons = require "icons"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

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
    mappings = {
      i = { ["<esc>"] = actions.close },
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
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    projects = {},
  },
}

require("telescope").load_extension "ui-select"
require("telescope").load_extension "fzf"
require("telescope").load_extension "projects"

vim.keymap.set("n", "<leader>f", "", { desc = "Finder" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Text" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>fl", builtin.resume, { desc = "Last Search" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })

vim.keymap.set("n", "/", builtin.current_buffer_fuzzy_find, { desc = "Find" })
vim.keymap.set("v", "/", builtin.current_buffer_fuzzy_find, { desc = "Find" })
vim.keymap.set("n", "?", builtin.current_buffer_fuzzy_find, { desc = "Find" })
vim.keymap.set("v", "?", builtin.current_buffer_fuzzy_find, { desc = "Find" })

vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Definition" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "References" })
vim.keymap.set(
  "n",
  "gI",
  builtin.lsp_implementations,
  { desc = "Implementations" }
)
vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "Diagnostics" })
