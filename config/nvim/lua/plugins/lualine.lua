return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local icons = require "icons"

      local mode = {
        "mode",
        icon = icons.mode,
        separator = { left = " ", right = "" },
        padding = 0,
      }

      local branch = {
        "b:gitsigns_head",
        icon = icons.branch,
        padding = { left = 2, right = 1 },
      }

      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end

      local diff = {
        "diff",
        colored = true,
        symbols = {
          added = icons.added,
          modified = icons.modified,
          removed = icons.removed,
        },
        source = diff_source,
      }

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_workspace_diagnostic" },
        symbols = {
          error = icons.error,
          warn = icons.warn,
          info = icons.info,
          hint = icons.hint,
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }

      local function selectioncount()
        local nvim_mode = vim.fn.mode(true)
        local line_start, col_start = vim.fn.line "v", vim.fn.col "v"
        local line_end, col_end = vim.fn.line ".", vim.fn.col "."
        if nvim_mode:match "" then
          return "("
            .. string.format(
              "%dx%d",
              math.abs(line_start - line_end) + 1,
              math.abs(col_start - col_end) + 1
            )
            .. ")"
        elseif nvim_mode:match "V" or line_start ~= line_end then
          return "(" .. math.abs(line_start - line_end) + 1 .. ")"
        elseif nvim_mode:match "v" then
          return "(" .. math.abs(col_start - col_end) + 1 .. ")"
        else
          return ""
        end
      end

      local location = function()
        local cursor = vim.fn.line "."
        local column = vim.fn.virtcol "."
        local selected = selectioncount()
        return cursor .. ":" .. column .. selected
      end

      local filetype = {
        "filetype",
        fmt = function(str)
          return str:gsub("^%l", str.upper)
        end,
      }

      local function progress_function()
        local cur = vim.fn.line "."
        local total = vim.fn.line "$"
        if cur == 1 then
          return "0%%"
        elseif cur == total then
          return "100%%"
        else
          local percentage = math.floor(cur / total * 100)
          if percentage < 10 then
            return string.format("%d%%%%", percentage)
          else
            return string.format("%2d%%%%", percentage)
          end
        end
      end

      local progress = {
        progress_function,
        icon = icons.progress,
        separator = { left = "", right = " " },
        padding = 0,
      }

      local function stl_escape(str)
        if type(str) ~= "string" then
          return str
        end
        return str:gsub("%%", "%%%%")
      end

      local function filepath_function()
        local path = vim.fn.expand "%:~:.:h"
        path = stl_escape(path)
        if path == "" or path == "." then
          return ""
        end
        path = path:gsub("/", " " .. icons.separator .. " ")
        return path .. " " .. icons.separator
      end

      local winbar_filepath = {
        filepath_function,
        color = { fg = "#585B70" },
        padding = { left = 1, right = 0 },
      }

      local winbar_filetype = {
        "filetype",
        colored = true,
        icon_only = true,
        padding = 1,
      }

      local winbar_filename = {
        "filename",
        file_status = true,
        newfile_status = false,
        path = 0,
        symbols = {
          modified = icons.modified,
          readonly = icons.readonly,
          unnamed = " No Name",
          newfile = " New",
        },
        padding = 0,
      }

      local function toggleterm_statusline()
        return "ToggleTerm #" .. vim.b.toggle_number
      end

      local toggleterm = {
        toggleterm_statusline,
        separator = { left = " ", right = "" },
        padding = 0,
      }

      local toggleterm_extension = {
        sections = {
          lualine_a = { toggleterm },
        },
        filetypes = { "toggleterm" },
      }

      return {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "alpha" },
            tabline = { "alpha" },
            winbar = { "alpha", "toggleterm", "neo-tree" },
          },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { mode },
          lualine_b = {},
          lualine_c = { branch, diff, diagnostics },
          lualine_x = { location, filetype },
          lualine_y = {},
          lualine_z = { progress },
        },
        tabline = {},
        winbar = {
          lualine_c = { winbar_filepath, winbar_filetype, winbar_filename },
        },
        inactive_winbar = {
          lualine_c = { winbar_filepath, winbar_filetype, winbar_filename },
        },
        extensions = { "man", toggleterm_extension },
      }
    end,
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
  },
}
