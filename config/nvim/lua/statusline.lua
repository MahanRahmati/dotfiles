local icons = require "icons"
local colors = require "colors"

local mode_hl_groups = {
  n = "SLNormal",
  i = "SLInsert",
  v = "SLVisual",
  V = "SLVisual",
  ["\22"] = "SLVisual",
  c = "SLCommand",
  s = "SLSelect",
  S = "SLSelect",
  ["\19"] = "SLSelect",
  R = "SLReplace",
  r = "SLReplace",
  ["!"] = "SLTerminal",
  t = "SLTerminal",
}

vim.api.nvim_set_hl(0, "SLNormal", { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "SLInsert", { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, "SLVisual", { fg = colors.purple, bold = true })
vim.api.nvim_set_hl(0, "SLCommand", { fg = colors.orange, bold = true })
vim.api.nvim_set_hl(0, "SLSelect", { fg = colors.dark_red, bold = true })
vim.api.nvim_set_hl(0, "SLReplace", { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "SLTerminal", { fg = colors.green, bold = true })

function _G.get_mode()
  local mode = vim.fn.mode()
  local hl_group = mode_hl_groups[mode:sub(1, 1)] or "SLNormal"
  return string.format("%%#%s#", hl_group) .. " " .. icons.mode .. " "
end

vim.api.nvim_set_hl(0, "SLGitAdd", { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, "SLGitChange", { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "SLGitDelete", { fg = colors.red, bold = true })

function _G.get_git_info()
  local ok, _ = pcall(require, "gitsigns")
  if not ok then
    return ""
  end

  local signs = vim.b.gitsigns_status_dict
  if not signs then
    return ""
  end

  local branch = signs.head
  local status = {}

  local branch_info = branch and (icons.branch .. " " .. branch .. " ") or ""

  if signs.added and signs.added > 0 then
    table.insert(
      status,
      "%#SLGitAdd#" .. icons.added .. signs.added .. "%#StatusLine#"
    )
  end
  if signs.changed and signs.changed > 0 then
    table.insert(
      status,
      "%#SLGitChange#" .. icons.modified .. signs.changed .. "%#StatusLine#"
    )
  end
  if signs.removed and signs.removed > 0 then
    table.insert(
      status,
      "%#SLGitDelete#" .. icons.removed .. signs.removed .. "%#StatusLine#"
    )
  end

  local status_info = #status > 0 and table.concat(status, " ") .. " " or ""

  return branch_info .. status_info
end

vim.api.nvim_set_hl(0, "SLDiagnosticError", { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "SLDiagnosticWarn", { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, "SLDiagnosticInfo", { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, "SLDiagnosticHint", { fg = colors.green, bold = true })

local function get_diagnostics_type(severity)
  return #vim.diagnostic.get(nil, { severity = severity })
end

function _G.get_diagnostics()
  local counts = {
    errors = get_diagnostics_type(vim.diagnostic.severity.ERROR),
    warnings = get_diagnostics_type(vim.diagnostic.severity.WARN),
    info = get_diagnostics_type(vim.diagnostic.severity.INFO),
    hints = get_diagnostics_type(vim.diagnostic.severity.HINT),
  }

  local parts = {}
  if counts.errors > 0 then
    table.insert(
      parts,
      "%#SLDiagnosticError#" .. icons.error .. counts.errors .. "%#StatusLine#"
    )
  end
  if counts.warnings > 0 then
    table.insert(
      parts,
      "%#SLDiagnosticWarn#" .. icons.warn .. counts.warnings .. "%#StatusLine#"
    )
  end
  if counts.info > 0 then
    table.insert(
      parts,
      "%#SLDiagnosticInfo#" .. icons.info .. counts.info .. "%#StatusLine#"
    )
  end
  if counts.hints > 0 then
    table.insert(
      parts,
      "%#SLDiagnosticHint#" .. icons.hint .. counts.hints .. "%#StatusLine#"
    )
  end

  return #parts > 0 and table.concat(parts, " ") .. " " or ""
end

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

function _G.get_location()
  local cursor = vim.fn.line "."
  local column = vim.fn.virtcol "."
  local selected = selectioncount()
  return " " .. cursor .. ":" .. column .. selected .. " "
end

function _G.get_progress()
  local mode = vim.fn.mode()
  local hl_group = mode_hl_groups[mode:sub(1, 1)] or "SLNormal"
  local cur = vim.fn.line "."
  local total = vim.fn.line "$"
  if cur == 1 then
    return string.format("%%#%s#%s ", hl_group, "0%%")
  end
  if cur == total then
    return string.format("%%#%s#%s ", hl_group, "100%%")
  end
  local percentage = math.floor(cur / total * 100)
  if percentage < 10 then
    local p = string.format("%d%%%%", percentage)
    return string.format("%%#%s#%s ", hl_group, p)
  else
    local p = string.format("%2d%%%%", percentage)
    return string.format("%%#%s#%s ", hl_group, p)
  end
end

vim.opt.statusline = table.concat {
  "%{%v:lua.get_mode()%} ",
  "%#StatusLine#",
  "%{%v:lua.get_git_info()%}",
  " ",
  "%=",
  "%{%v:lua.get_diagnostics()%}",
  "%{%v:lua.get_location()%}",
  "%{%v:lua.get_progress()%}",
}

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    vim.cmd "redrawstatus"
  end,
})
