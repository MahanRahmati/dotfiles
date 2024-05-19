return {
  {
    "rebelot/heirline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local icons = require "icons"
      local conditions = require "heirline.conditions"
      local colors = require("catppuccin.palettes").get_palette()

      local function check_filetype(filetype)
        return conditions.buffer_matches { filetype = { filetype } }
      end

      local function should_be_disabled()
        local file_types = {
          "help",
          "toggleterm",
          "neo%-tree",
          "lspinfo",
          "lazy",
          "mason",
          "TelescopePrompt",
          "TelescopeResults",
          "dashboard",
        }
        return conditions.buffer_matches { filetype = file_types }
      end

      local item_hl = { bg = colors.surface0, bold = true }

      local start_left_divider = {
        provider = " ",
        hl = { bg = colors.surface0, fg = colors.base },
      }

      local start_right_divider = {
        provider = "",
        hl = { bg = colors.base, fg = colors.surface0 },
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

      local file_name = {
        init = function(self)
          self.filename = vim.api.nvim_buf_get_name(0)
        end,
        condition = function()
          if should_be_disabled() then
            return false
          end
          return true
        end,
        {
          provider = function()
            local filepath = filepath_function()
            if filepath == "" then
              return ""
            end
            return " " .. filepath
          end,
          hl = item_hl,
        },
        {
          init = function(self)
            local filename = vim.api.nvim_buf_get_name(0)
            local extension = vim.fn.fnamemodify(filename, ":e")
            self.icon, self.icon_color =
              require("nvim-web-devicons").get_icon_color(
                filename,
                extension,
                { default = true }
              )
          end,
          provider = function(self)
            return " " .. self.icon .. " "
          end,
          hl = function(self)
            return { bg = colors.surface0, fg = self.icon_color }
          end,
        },
        {
          provider = function()
            local filename = vim.fn.expand "%:t"
            if filename == "" then
              return "No Name"
            end
            return filename
          end,
          hl = item_hl,
        },
        {
          condition = function()
            if should_be_disabled() then
              return false
            end
            return vim.bo.modified
          end,
          provider = " " .. icons.modified,
          hl = item_hl,
        },
        {
          condition = function()
            if should_be_disabled() then
              return false
            end
            return not vim.bo.modifiable or vim.bo.readonly
          end,
          provider = " " .. icons.readonly,
          hl = item_hl,
        },
        {
          condition = function()
            return not vim.bo.modified
          end,
          provider = " ",
          hl = item_hl,
        },
        start_right_divider,
      }

      local mode_names = {
        n = "NORMAL",
        no = "O-PENDING",
        nov = "O-PENDING",
        noV = "O-PENDING",
        ["no\22"] = "O-PENDING",
        niI = "NORMAL",
        niR = "NORMAL",
        niV = "NORMAL",
        nt = "NORMAL",
        v = "VISUAL",
        vs = "VISUAL",
        V = "V-LINE",
        Vs = "V-LINE",
        ["\22"] = "V-BLOCK",
        ["\22s"] = "V-BLOCK",
        s = "SELECT",
        S = "S-LINE",
        ["\19"] = "S-BLOCK",
        i = "INSERT",
        ic = "INSERT",
        ix = "INSERT",
        R = "REPLACE",
        Rc = "REPLACE",
        Rx = "REPLACE",
        Rv = "V-REPLACE",
        Rvc = "V-REPLACE",
        Rvx = "V-REPLACE",
        c = "COMMAND",
        cv = "EX",
        r = "REPLACE",
        rm = "MORE",
        ["r?"] = "CONFIRM",
        ["!"] = "SHELL",
        t = "TERMINAL",
      }

      local mode_colors = {
        n = colors.blue,
        i = colors.green,
        v = colors.mauve,
        V = colors.mauve,
        ["\22"] = colors.mauve,
        c = colors.peach,
        s = colors.pink,
        S = colors.pink,
        ["\19"] = colors.pink,
        R = colors.red,
        r = colors.red,
        ["!"] = colors.red,
        t = colors.green,
      }

      local vi_mode = {
        init = function(self)
          self.mode = vim.fn.mode(1)
        end,
        {
          provider = function(self)
            return " " .. icons.mode .. " " .. mode_names[self.mode] .. " "
          end,
          hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { bg = mode_colors[mode], fg = colors.base, bold = true }
          end,
        },
        {
          provider = "",
          hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = mode_colors[mode] }
          end,
        },
        update = { "ModeChanged" },
      }

      local git_branch = {
        init = function(self)
          ---@diagnostic disable-next-line: undefined-field
          self.status_dict = vim.b.gitsigns_status_dict
        end,
        condition = conditions.is_git_repo,
        start_left_divider,
        {
          provider = function(self)
            return icons.branch .. " " .. self.status_dict.head .. " "
          end,
          hl = item_hl,
        },
        start_right_divider,
      }

      local git_status = {
        init = function(self)
          ---@diagnostic disable-next-line: undefined-field
          self.status_dict = vim.b.gitsigns_status_dict
        end,
        condition = conditions.is_git_repo,
        {
          condition = function(self)
            local added = self.status_dict.added or 0
            local changed = self.status_dict.changed or 0
            local removed = self.status_dict.removed or 0
            return added + changed + removed > 0
          end,
          provider = " ",
          hl = { bg = colors.surface0, fg = colors.base },
        },
        {
          provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and (icons.added .. count .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.green, bold = true },
        },
        {
          provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and (icons.modified .. count .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.yellow, bold = true },
        },
        {
          provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and (icons.removed .. count .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.red, bold = true },
        },
        {
          condition = function(self)
            local added = self.status_dict.added or 0
            local changed = self.status_dict.changed or 0
            local removed = self.status_dict.removed or 0
            return added + changed + removed > 0
          end,
          provider = "",
          hl = { bg = colors.base, fg = colors.surface0 },
        },
      }

      local diagnostics = {
        init = function(self)
          local workspace_diagnostics = function(severity)
            local count = vim.diagnostic.get(nil, { severity = severity })
            return vim.tbl_count(count)
          end
          self.errors = workspace_diagnostics(vim.diagnostic.severity.ERROR)
          self.warnings = workspace_diagnostics(vim.diagnostic.severity.WARN)
          self.hints = workspace_diagnostics(vim.diagnostic.severity.HINT)
          self.info = workspace_diagnostics(vim.diagnostic.severity.INFO)
        end,
        condition = conditions.has_diagnostics,
        {
          condition = function(self)
            return self.errors + self.warnings + self.info + self.hints > 0
          end,
          provider = " ",
          hl = { bg = colors.surface0, fg = colors.base },
        },
        {
          provider = function(self)
            return self.errors > 0 and (icons.error .. self.errors .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.red, bold = true },
        },
        {
          provider = function(self)
            return self.warnings > 0 and (icons.warn .. self.warnings .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.yellow, bold = true },
        },
        {
          provider = function(self)
            return self.info > 0 and (icons.info .. self.info .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.sky, bold = true },
        },
        {
          provider = function(self)
            return self.hints > 0 and (icons.hint .. self.hints .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.sky, bold = true },
        },
        {
          condition = function(self)
            return self.errors + self.warnings + self.info + self.hints > 0
          end,
          provider = "",
          hl = { bg = colors.base, fg = colors.surface0 },
        },
        update = { "DiagnosticChanged", "BufEnter" },
      }

      local end_left_divider = {
        provider = "",
        hl = { bg = colors.base, fg = colors.surface0 },
      }

      local end_right_divider = {
        provider = "",
        hl = { bg = colors.surface0, fg = colors.base },
      }

      local search_count = {
        init = function(self)
          local ok, search = pcall(vim.fn.searchcount)
          if ok and search.total then
            self.search = search
          end
        end,
        condition = function()
          return vim.v.hlsearch ~= 0
        end,
        end_left_divider,
        {
          provider = function(self)
            local search = self.search
            return " "
              .. icons.find
              .. string.format(
                "%d/%d ",
                search.current,
                math.min(search.total, search.maxcount)
              )
          end,
          hl = item_hl,
        },
        end_right_divider,
      }

      local lsp_active = {
        condition = conditions.lsp_attached,
        end_left_divider,
        {
          provider = function()
            local names = {}
            for _, server in pairs(vim.lsp.get_clients { bufnr = 0 }) do
              table.insert(names, server.name)
            end
            return " " .. icons.configuration .. table.concat(names, " ") .. " "
          end,
          hl = item_hl,
        },
        end_right_divider,
        update = { "LspAttach", "LspDetach" },
      }

      local file_type = {
        condition = function()
          if should_be_disabled() then
            return false
          end
          return true
        end,
        end_left_divider,
        {
          init = function(self)
            local filename = vim.api.nvim_buf_get_name(0)
            local extension = vim.fn.fnamemodify(filename, ":e")
            self.icon, self.icon_color =
              require("nvim-web-devicons").get_icon_color(
                filename,
                extension,
                { default = true }
              )
          end,
          provider = function(self)
            return " " .. self.icon .. " "
          end,
          hl = function(self)
            return { bg = colors.surface0, fg = self.icon_color }
          end,
        },
        {
          provider = function()
            local type = vim.bo.filetype
            return type:gsub("^%l", type.upper) .. " "
          end,
          hl = item_hl,
        },
        end_right_divider,
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

      local location = {
        end_left_divider,
        {
          provider = function()
            local cursor = vim.fn.line "."
            local column = vim.fn.virtcol "."
            local selected = selectioncount()
            return " " .. cursor .. ":" .. column .. selected .. " "
          end,
          hl = item_hl,
        },
        end_right_divider,
      }

      local progress = {
        init = function(self)
          self.mode = vim.fn.mode(1)
        end,
        {
          provider = "",
          hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = mode_colors[mode] }
          end,
        },

        {
          provider = function()
            local icon = icons.progress
            local cur = vim.fn.line "."
            local total = vim.fn.line "$"
            if cur == 1 then
              return " " .. icon .. " " .. "0%%" .. " "
            end
            if cur == total then
              return " " .. icon .. " " .. "100%%" .. " "
            end
            local percentage = math.floor(cur / total * 100)
            if percentage < 10 then
              return " "
                .. icon
                .. " "
                .. string.format("%d%%%%", percentage)
                .. " "
            else
              return " "
                .. icon
                .. " "
                .. string.format("%2d%%%%", percentage)
                .. " "
            end
          end,
          hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { bg = mode_colors[mode], fg = colors.base, bold = true }
          end,
        },
      }

      return {
        winbar = {
          file_name,
        },
        statusline = {
          vi_mode,
          git_branch,
          git_status,
          diagnostics,
          { provider = "%=" },
          search_count,
          lsp_active,
          file_type,
          location,
          progress,
        },
        opts = {
          colors = colors,
        },
      }
    end,
  },
}
