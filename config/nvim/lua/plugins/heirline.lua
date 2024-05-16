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

      local vi_mode = {
        init = function(self)
          self.mode = vim.fn.mode(1)
        end,
        static = {
          mode_names = {
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
          },
          mode_colors = {
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
          },
          mode_icon = icons.mode,
        },
        {
          provider = function(self)
            return " "
              .. self.mode_icon
              .. " "
              .. self.mode_names[self.mode]
              .. " "
          end,
          hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { bg = self.mode_colors[mode], fg = colors.base, bold = true }
          end,
        },
        {
          provider = "",
          hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = self.mode_colors[mode] }
          end,
        },
        update = { "ModeChanged" },
      }

      local file_name = {
        init = function(self)
          self.filename = vim.api.nvim_buf_get_name(0)
        end,
        {
          provider = " ",
          hl = { bg = colors.surface0, fg = colors.base },
        },
        {
          provider = function(self)
            if check_filetype "help" then
              return "Help"
            end

            if check_filetype "toggleterm" then
              return "Terminal"
            end

            if check_filetype "neo%-tree" then
              return "Neo-tree"
            end

            if check_filetype "lspinfo" then
              return "LSP Info"
            end

            if check_filetype "lazy" then
              return "Lazy"
            end

            if check_filetype "mason" then
              return "Mason"
            end

            if
              check_filetype "TelescopePrompt"
              or check_filetype "TelescopeResults"
            then
              return "Telescope "
            end

            if check_filetype "dashboard" then
              return "Dashboard"
            end

            local filename = vim.fn.fnamemodify(self.filename, ":.")
            if filename == "" then
              return "No Name"
            end
            if not conditions.width_percent_below(#filename, 0.25) then
              filename = vim.fn.pathshorten(filename)
            end
            return filename
          end,
          hl = { bg = colors.surface0, bold = true },
        },
        {
          init = function(self)
            self.filename = vim.api.nvim_buf_get_name(0)
          end,
          condition = function()
            if check_filetype "help" then
              return false
            end

            if check_filetype "toggleterm" then
              return false
            end

            if check_filetype "neo%-tree" then
              return false
            end

            if check_filetype "lspinfo" then
              return false
            end

            if check_filetype "lazy" then
              return false
            end

            if check_filetype "mason" then
              return false
            end
            if
              check_filetype "TelescopePrompt"
              or check_filetype "TelescopeResults"
            then
              return false
            end

            if check_filetype "dashboard" then
              return false
            end
            return vim.bo.modified
          end,
          provider = " " .. icons.modified,
          hl = { bg = colors.surface0 },
        },
        {
          init = function(self)
            self.filename = vim.api.nvim_buf_get_name(0)
          end,
          condition = function()
            if check_filetype "help" then
              return false
            end

            if check_filetype "toggleterm" then
              return false
            end

            if check_filetype "neo%-tree" then
              return false
            end

            if check_filetype "lspinfo" then
              return false
            end

            if check_filetype "lazy" then
              return false
            end

            if check_filetype "mason" then
              return false
            end
            if
              check_filetype "TelescopePrompt"
              or check_filetype "TelescopeResults"
            then
              return false
            end

            if check_filetype "dashboard" then
              return false
            end
            return not vim.bo.modifiable or vim.bo.readonly
          end,
          provider = " " .. icons.readonly,
          hl = { bg = colors.surface0 },
        },
        {
          condition = function()
            return not vim.bo.modified
          end,
          provider = " ",
          hl = { bg = colors.surface0 },
        },
        {
          provider = "",
          hl = { bg = colors.base, fg = colors.surface0 },
        },
      }

      local git_branch = {
        init = function(self)
          ---@diagnostic disable-next-line: undefined-field
          self.status_dict = vim.b.gitsigns_status_dict
        end,
        condition = conditions.is_git_repo,
        static = {
          branch_icon = icons.branch,
        },
        {
          provider = " ",
          hl = { bg = colors.surface0, fg = colors.base },
        },
        {
          provider = function(self)
            return self.branch_icon .. " " .. self.status_dict.head .. " "
          end,
          hl = { bg = colors.surface0, bold = true },
        },
        {
          provider = "",
          hl = { bg = colors.base, fg = colors.surface0 },
        },
      }

      local git_status = {
        init = function(self)
          ---@diagnostic disable-next-line: undefined-field
          self.status_dict = vim.b.gitsigns_status_dict
        end,
        condition = conditions.is_git_repo,
        static = {
          added_icon = icons.added,
          removed_icon = icons.removed,
          modified_icon = icons.modified,
        },
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
            return count > 0 and (self.added_icon .. count .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.green, bold = true },
        },
        {
          provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and (self.modified_icon .. count .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.yellow, bold = true },
        },
        {
          provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and (self.removed_icon .. count .. " ")
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
          self.errors =
            #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
          self.warnings =
            #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
          self.hints =
            #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
          self.info =
            #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        end,
        condition = conditions.has_diagnostics,
        static = {
          error_icon = icons.error,
          warn_icon = icons.warn,
          info_icon = icons.info,
          hint_icon = icons.hint,
        },
        {
          condition = function(self)
            return self.errors + self.warnings + self.info + self.hints > 0
          end,
          provider = " ",
          hl = { bg = colors.surface0, fg = colors.base },
        },
        {
          provider = function(self)
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.red, bold = true },
        },
        {
          provider = function(self)
            return self.warnings > 0
              and (self.warn_icon .. self.warnings .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.yellow, bold = true },
        },
        {
          provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
          end,
          hl = { bg = colors.surface0, fg = colors.sky, bold = true },
        },
        {
          provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints .. " ")
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

      -- End
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
        static = {
          find_icon = icons.find,
        },
        {
          condition = function()
            return vim.v.hlsearch ~= 0
          end,
          provider = "",
          hl = { bg = colors.base, fg = colors.surface0 },
        },
        {
          provider = function(self)
            local search = self.search
            return " "
              .. self.find_icon
              .. string.format(
                "%d/%d ",
                search.current,
                math.min(search.total, search.maxcount)
              )
          end,
          hl = { bg = colors.surface0, bold = true },
        },
        {
          condition = function()
            return vim.v.hlsearch ~= 0
          end,
          provider = "",
          hl = { bg = colors.surface0, fg = colors.base },
        },
      }

      local lsp_active = {
        condition = conditions.lsp_attached,
        static = {
          configuration_icon = icons.configuration,
        },
        {
          condition = conditions.lsp_attached,
          provider = "",
          hl = { bg = colors.base, fg = colors.surface0 },
        },
        {
          provider = function(self)
            local names = {}
            for _, server in pairs(vim.lsp.get_clients { bufnr = 0 }) do
              table.insert(names, server.name)
            end
            return " "
              .. self.configuration_icon
              .. table.concat(names, " ")
              .. " "
          end,
          hl = { bg = colors.surface0, bold = true },
        },
        {
          condition = conditions.lsp_attached,
          provider = "",
          hl = { bg = colors.surface0, fg = colors.base },
        },
        update = { "LspAttach", "LspDetach" },
      }

      local file_type = {
        condition = function()
          if check_filetype "help" then
            return false
          end

          if check_filetype "toggleterm" then
            return false
          end

          if check_filetype "neo%-tree" then
            return false
          end

          if check_filetype "lspinfo" then
            return false
          end

          if check_filetype "lazy" then
            return false
          end

          if check_filetype "mason" then
            return false
          end

          if
            check_filetype "TelescopePrompt"
            or check_filetype "TelescopeResults"
          then
            return false
          end

          if check_filetype "dashboard" then
            return false
          end
          return true
        end,
        {
          provider = "",
          hl = { bg = colors.base, fg = colors.surface0 },
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
            local type = vim.bo.filetype
            return type:gsub("^%l", type.upper) .. " "
          end,
          hl = { bg = colors.surface0, bold = true },
        },
        {
          provider = "",
          hl = { bg = colors.surface0, fg = colors.base },
        },
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
        {
          provider = "",
          hl = { bg = colors.base, fg = colors.surface0 },
        },
        {
          provider = function()
            local cursor = vim.fn.line "."
            local column = vim.fn.virtcol "."
            local selected = selectioncount()
            return " " .. cursor .. ":" .. column .. selected .. " "
          end,
          hl = { bg = colors.surface0, bold = true },
        },
        {
          provider = "",
          hl = { bg = colors.surface0, fg = colors.base },
        },
      }

      local progress = {
        init = function(self)
          self.mode = vim.fn.mode(1)
        end,
        static = {
          mode_names = {
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
          },
          mode_colors = {
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
          },
        },
        {
          provider = "",
          hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = self.mode_colors[mode] }
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
            return { bg = self.mode_colors[mode], fg = colors.base, bold = true }
          end,
        },
      }

      return {
        statusline = {
          vi_mode,
          file_name,
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
