return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = function()
      local icons = require "icons"

      local layout = {
        reverse = true,
        preview = vim.o.columns >= 120,
        layout = {
          box = "horizontal",
          width = 0,
          height = vim.o.lines - 1,
          {
            box = "vertical",
            border = "rounded",
            title = "{title}",
            { win = "list", border = "none" },
            { win = "input", height = 1, border = "top" },
          },
          {
            win = "preview",
            title = "",
            border = "rounded",
            width = 0.5,
          },
        },
      }

      ---@type snacks.Config
      return {
        animate = { enabled = false },
        bigfile = {},
        bufdelete = {},
        dashboard = {
          width = 60,
          row = nil,
          col = nil,
          pane_gap = 4,
          preset = {
            header = [[
       ████  █████                              ███                 
      ███████████                                                     
     ████████████████████████████    ███████████████████████
    ███████████████   ██████████  ███████████████████████ 
   ████████████████████████ ████████████████████████  
  █████████████       ███ █████████████████████████   
 █████  █████████████ █████████ ████████████████████    ]],
          },
          sections = {
            { section = "header" },
            { section = "recent_files", limit = 9, padding = 1 },
            {
              {
                icon = icons.file,
                key = "n",
                desc = "New File",
                action = ":ene | startinsert",
              },
              {
                icon = icons.find,
                key = "f",
                desc = "Find File",
                action = ":lua require('snacks').picker.files()",
              },
              {
                icon = icons.folder,
                key = "r",
                desc = "Recent Projects",
                action = ":lua require('snacks').picker.projects()",
              },
              {
                icon = icons.configuration,
                key = "c",
                desc = "Configuration",
                action = function()
                  vim.cmd.edit "~/.config/nvim/init.lua"
                  vim.fn.chdir "~/.config/nvim"
                end,
              },
              {
                icon = icons.lazy,
                key = "p",
                desc = "Package Manager",
                action = ":Lazy",
                enabled = package.loaded.lazy ~= nil,
              },
              {
                icon = icons.quit,
                key = "q",
                desc = "Quit",
                action = ":qa",
              },
            },
            { section = "startup", icon = "", padding = 1 },
          },
        },
        debug = { enabled = false },
        dim = { enabled = false },
        explorer = { enabled = false },
        git = { enabled = false },
        gitbrowse = { enabled = false },
        image = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        layout = { enabled = false },
        lazygit = {},
        notifier = {
          timeout = 3000,
          margin = { top = 0, right = 0, bottom = 0 },
          icons = {
            error = icons.error,
            warn = icons.warn,
            info = icons.info,
            debug = icons.debug,
            trace = icons.trace,
          },
          style = "compact",
          top_down = false,
        },
        picker = {
          win = {
            input = {
              keys = {
                ["<Esc>"] = { "close", mode = { "n", "i" } },
              },
            },
          },
          sources = {
            buffers = {
              layout = { preset = "select" },
            },
            files = {
              hidden = true,
              ignored = false,
              follow = true,
              show_empty = true,
              supports_live = true,
              layout = layout,
            },
            help = { layout = layout },
            recent = { layout = layout },
            lines = { layout = layout },
            diagnostics = { layout = layout },
            grep = { hidden = true, follow = true, layout = layout },
            projects = { layout = layout },
          },
          icons = {
            files = {
              enabled = true,
              dir = icons.folder,
              dir_open = icons.folder,
              file = icons.file,
            },
            diagnostics = {
              Error = icons.error,
              Warn = icons.warn,
              Hint = icons.hint,
              Info = icons.info,
            },
          },
        },
        profiler = { enabled = false },
        quickfile = { enabled = false },
        rename = { enabled = false },
        scope = { enabled = false },
        scratch = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        terminal = {},
        toggle = { enabled = false },
        util = { enabled = false },
        win = { enabled = false },
        words = { enabled = false },
        zen = { enabled = false },
        styles = {
          lazygit = {
            width = 0,
            height = vim.o.lines - 3,
            border = "rounded",
          },
          terminal = {
            width = 0,
            height = 15,
            border = "rounded",
            row = vim.o.lines - 3 - 15,
          },
          notification = {
            border = "rounded",
            wo = { wrap = true },
          },
        },
      }
    end,
    keys = {
      {
        "<leader>gg",
        ":lua require('snacks').lazygit()<CR>",
        desc = "LazyGit",
      },
      {
        "<leader>c",
        ":lua require('snacks').bufdelete()<CR>",
        desc = "Close Buffer",
      },
      {
        "<leader>t",
        ":lua require('snacks').terminal.toggle('fish')<CR>",
        desc = "Terminal",
      },
      {
        "<Esc>",
        "<ESC>:noh<CR>:lua require('snacks').notifier.hide()<CR>",
        desc = "Dismiss Notifications",
      },
      {
        "<leader>b",
        ":lua require('snacks').picker.buffers()<CR>",
        desc = "Buffers",
      },
      {
        "<leader>fb",
        ":lua require('snacks').picker.buffers()<CR>",
        desc = "Buffers",
      },
      {
        "<leader>ff",
        ":lua require('snacks').picker.files()<CR>",
        desc = "Find Files",
      },
      {
        "<leader>fg",
        ":lua require('snacks').picker.grep()<CR>",
        desc = "Find Text",
      },
      {
        "<leader>fh",
        ":lua require('snacks').picker.help()<CR>",
        desc = "Help",
      },
      {
        "<leader>fl",
        ":lua require('snacks').picker.resume()<CR>",
        desc = "Last Search",
      },
      {
        "<leader>fr",
        ":lua require('snacks').picker.recent()<CR>",
        desc = "Recent Files",
      },
      {
        "/",
        ":lua require('snacks').picker.lines()<CR>",
        mode = { "n", "v" },
        desc = "Find",
      },
      {
        "?",
        ":lua require('snacks').picker.lines()<CR>",
        mode = { "n", "v" },
        desc = "Find",
      },
      {
        "gd",
        ":lua require('snacks').picker.lsp_definitions()<CR>",
        desc = "Definition",
      },
      {
        "gr",
        ":lua require('snacks').picker.lsp_references()<CR>",
        desc = "References",
      },
      {
        "gI",
        ":lua require('snacks').picker.lsp_implementations()<CR>",
        desc = "Implementations",
      },
      {
        "<leader>ld",
        ":lua require('snacks').picker.diagnostics()<CR>",
        desc = "Diagnostics",
      },
    },
  },
}
