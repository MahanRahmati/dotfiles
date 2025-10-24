local icons = require "icons"

local function highlight_setter(name, link)
  vim.api.nvim_set_hl(0, name, { link = link, bold = true })
end

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

highlight_setter("SLNormal", "Function")
highlight_setter("SLInsert", "String")
highlight_setter("SLVisual", "Statement")
highlight_setter("SLCommand", "WarningMsg")
highlight_setter("SLSelect", "Special")
highlight_setter("SLReplace", "Error")
highlight_setter("SLTerminal", "String")

function _G.get_mode()
  local mode = vim.fn.mode()
  local hl_group = mode_hl_groups[mode:sub(1, 1)] or "SLNormal"
  return string.format("%%#%s#", hl_group) .. " " .. icons.mode .. " "
end

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

  local branch_info = branch and (icons.branch .. " " .. branch .. " ") or ""

  return branch_info
end

highlight_setter("SLDiagnosticError", "DiagnosticError")
highlight_setter("SLDiagnosticWarn", "DiagnosticWarn")
highlight_setter("SLDiagnosticInfo", "DiagnosticInfo")
highlight_setter("SLDiagnosticHint", "DiagnosticHint")

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

local model_name_cache = ""
local llama_timer = vim.uv.new_timer()
if llama_timer then
  local model_id_to_name = {}

  llama_timer:start(
    1000,
    30000,
    vim.schedule_wrap(function()
      vim.schedule(function()
        local handle =
          io.popen "curl -X GET 'http://localhost:11434/v1/models' -s"
        if handle then
          local result = handle:read "*a"
          handle:close()

          if result ~= "" then
            local models = vim.fn.json_decode(result)
            if models and models.data then
              for _, model in ipairs(models.data) do
                model_id_to_name[model.id] = model.name
              end
            end
          end
        end
      end)

      local handle = io.popen "curl -X GET 'http://localhost:11434/running' -s"
      if handle then
        local result = handle:read "*a"
        handle:close()

        local model_id = result:match '"model":"([^"]+)"'
        if model_id and model_id_to_name[model_id] then
          model_name_cache = model_id_to_name[model_id]
        else
          model_name_cache = ""
        end

        vim.cmd "redrawstatus"
      end
    end)
  )
end

function _G.get_llama()
  if model_name_cache ~= "" then
    return icons.copilot .. " " .. model_name_cache .. " "
  end
  return icons.copilot_disabled .. " "
end

local go_version_cache = nil

function _G.get_go_version()
  if vim.bo.filetype ~= "go" then
    return ""
  end

  local icon, icon_hl
  local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
  if devicons_ok then
    icon, icon_hl = devicons.get_icon_by_filetype "go"
  end

  local version_text = go_version_cache or ""
  if version_text ~= "" and icon then
    return string.format(
      "%%#%s#%s%%#StatusLine# %s ",
      icon_hl,
      icon,
      version_text
    )
  elseif version_text ~= "" then
    return "Go " .. version_text .. " "
  end

  vim.schedule(function()
    local handle = io.popen "go version"
    if handle then
      local result = handle:read "*a"
      handle:close()
      go_version_cache = result:match "go(%d+%.%d+%.%d+)"
      if go_version_cache then
        vim.cmd "redrawstatus"
      end
    end
  end)

  return ""
end

local dart_version_cache = nil

function _G.get_dart_version()
  if vim.bo.filetype ~= "dart" then
    return ""
  end

  local icon, icon_hl
  local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
  if devicons_ok then
    icon, icon_hl = devicons.get_icon_by_filetype "dart"
  end

  local version_text = dart_version_cache or ""
  if version_text ~= "" and icon then
    return string.format(
      "%%#%s#%s%%#StatusLine# %s ",
      icon_hl,
      icon,
      version_text
    )
  elseif version_text ~= "" then
    return "Dart " .. version_text .. " "
  end

  vim.schedule(function()
    local handle = io.popen "dart --version 2>&1"
    if handle then
      local result = handle:read "*a"
      handle:close()
      dart_version_cache = result:match "Dart SDK version: (%d+%.%d+%.%d+)"
      if dart_version_cache then
        vim.cmd "redrawstatus"
      end
    end
  end)

  return ""
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
  "%{%v:lua.get_git_info()%} ",
  "%{%v:lua.get_diagnostics()%}",
  "%=",
  "%{%v:lua.get_llama()%}",
  "%{%v:lua.get_go_version()%}",
  "%{%v:lua.get_dart_version()%}",
  "%{%v:lua.get_location()%}",
  "%{%v:lua.get_progress()%}",
}

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    vim.cmd "redrawstatus"
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.cmd "redrawstatus"
  end,
})
