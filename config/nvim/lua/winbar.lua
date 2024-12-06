local icons = require "icons"
local colors = require "colors"

local function stl_escape(str)
  if type(str) ~= "string" then
    return str
  end
  return str:gsub("%%", "%%%%")
end

function _G.get_filepath()
  local path = vim.fn.expand "%:~:.:h"
  path = stl_escape(path)
  if path == "" or path == "." then
    return ""
  end
  path = path:gsub("/", " " .. icons.separator .. " ")
  return path .. " " .. icons.separator
end

function _G.get_file_icon()
  local filename = vim.api.nvim_buf_get_name(0)
  local extension = vim.fn.fnamemodify(filename, ":e")
  local icon, _ = require("nvim-web-devicons").get_icon_color(
    filename,
    extension,
    { default = true }
  )
  return icon .. " "
end

function _G.get_filename()
  local filename = vim.fn.expand "%:t"
  if filename == "" then
    return "No Name"
  end
  return filename
end

function _G.get_modified()
  if not vim.bo.modified then
    return ""
  end
  return icons.modified
end

function _G.get_readonly()
  if vim.bo.modifiable and not vim.bo.readonly then
    return ""
  end
  return icons.readonly
end

vim.api.nvim_set_hl(0, "WinBarSearchCount", { fg = colors.yellow })

function _G.get_search_count()
  if vim.v.hlsearch == 0 then
    return ""
  end

  local count = vim.fn.searchcount()
  return "%#WinBarSearchCount#"
    .. icons.find
    .. string.format(
      "%d/%d",
      count.current,
      math.min(count.total, count.maxcount)
    )
    .. "%* "
end

local function should_disable_winbar()
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
    "WhichKey",
  }
  return vim.tbl_contains(file_types, vim.bo.filetype)
end

function _G.get_winbar()
  if should_disable_winbar() then
    return ""
  end
  return table.concat {
    "%#StatusLine#",
    " ",
    "%{%v:lua.get_filepath()%}",
    " %{%v:lua.get_file_icon()%}",
    "%{%v:lua.get_filename()%}",
    " %{%v:lua.get_modified()%}",
    " %{%v:lua.get_readonly()%}",
    "%=",
    " %{%v:lua.get_search_count()%}",
  }
end

vim.opt.winbar = "%{%v:lua.get_winbar()%}"
