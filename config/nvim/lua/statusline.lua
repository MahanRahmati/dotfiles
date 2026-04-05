local icons = require "icons"

function _G.capsule(highlight, text)
  return string.format("%%#%s#", highlight)
    .. ""
    .. text
    .. string.format("%%#%s#", highlight)
    .. ""
    .. "%#StatusLine#"
end

function _G.capsule_middle(highlight, text)
  return string.format("%%#%s#", highlight) .. text
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

local mode_hl_alt_groups = {
  n = "SLNormalAlt",
  i = "SLInsertAlt",
  v = "SLVisualAlt",
  V = "SLVisualAlt",
  ["\22"] = "SLVisualAlt",
  c = "SLCommandAlt",
  s = "SLSelectAlt",
  S = "SLSelectAlt",
  ["\19"] = "SLSelectAlt",
  R = "SLReplaceAlt",
  r = "SLReplaceAlt",
  ["!"] = "SLTerminalAlt",
  t = "SLTerminalAlt",
}

function _G.get_mode()
  local mode = vim.fn.mode()
  local hl_group = mode_hl_groups[mode:sub(1, 1)] or "SLNormal"
  local hl_alt_group = mode_hl_alt_groups[mode:sub(1, 1)] or "SLNormalAlt"
  return capsule(hl_alt_group, capsule_middle(hl_group, icons.mode .. " "))
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

  local branch_info = branch and (icons.branch .. " " .. branch) or ""

  if branch_info == "" then
    return ""
  end

  return capsule("SLItemAlt", capsule_middle("SLItem", branch_info .. " "))
end

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
      capsule(
        "SLDiagnosticErrorAlt",
        capsule_middle("SLDiagnosticError", icons.error .. counts.errors)
      )
    )
  end
  if counts.warnings > 0 then
    table.insert(
      parts,
      capsule(
        "SLDiagnosticWarnAlt",
        capsule_middle("SLDiagnosticWarn", icons.warn .. counts.warnings)
      )
    )
  end
  if counts.info > 0 then
    table.insert(
      parts,
      capsule(
        "SLDiagnosticInfoAlt",
        capsule_middle("SLDiagnosticInfo", icons.info .. counts.info)
      )
    )
  end

  if counts.hints > 0 then
    table.insert(
      parts,
      capsule(
        "SLDiagnosticHintAlt",
        capsule_middle("SLDiagnosticHint", icons.hint .. counts.hints)
      )
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
    return capsule(
      "SLCopilotEnabledAlt",
      capsule_middle(
        "SLCopilotEnabled",
        icons.copilot .. " " .. model_name_cache .. "%*"
      )
    )
  end
  return capsule(
    "SLCopilotDisabledAlt",
    capsule_middle("SLCopilotDisabled", icons.copilot_disabled .. "%*")
  )
end

local go_version_cache = nil

function _G.get_go_version()
  if vim.bo.filetype ~= "go" then
    return ""
  end

  local icon
  local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
  if devicons_ok then
    icon, _ = devicons.get_icon_by_filetype "go"
  end

  local version_text = go_version_cache or ""
  if version_text ~= "" and icon then
    return capsule(
      "SLItemAlt",
      capsule_middle("SLItem", icon .. " " .. version_text)
    ) .. " "
  elseif version_text ~= "" then
    return capsule("SLItemAlt", capsule_middle("SLItem", "Go " .. version_text))
      .. " "
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

  local icon
  local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
  if devicons_ok then
    icon, _ = devicons.get_icon_by_filetype "dart"
  end

  local version_text = dart_version_cache or ""
  if version_text ~= "" and icon then
    return capsule(
      "SLItemAlt",
      capsule_middle("SLItem", icon .. " " .. version_text)
    ) .. " "
  elseif version_text ~= "" then
    return capsule(
      "SLItemAlt",
      capsule_middle("SLItem", "Dart " .. version_text)
    ) .. " "
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

local rust_version_cache = nil

function _G.get_rust_version()
  if vim.bo.filetype ~= "rust" then
    return ""
  end

  local icon
  local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
  if devicons_ok then
    icon, _ = devicons.get_icon_by_filetype "rust"
  end

  local version_text = rust_version_cache or ""
  if version_text ~= "" and icon then
    return capsule(
      "SLItemAlt",
      capsule_middle("SLItem", icon .. " " .. version_text)
    ) .. " "
  elseif version_text ~= "" then
    return capsule(
      "SLItemAlt",
      capsule_middle("SLItem", "Rust " .. version_text)
    ) .. " "
  end

  vim.schedule(function()
    local handle = io.popen "rustc --version 2>&1"
    if handle then
      local result = handle:read "*a"
      handle:close()
      rust_version_cache = result:match "rustc (%d+%.%d+%.%d+)"
      if rust_version_cache then
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
  return capsule(
    "SLItemAlt",
    capsule_middle("SLItem", cursor .. ":" .. column .. selected)
  )
end

function _G.get_progress()
  local mode = vim.fn.mode()
  local hl_group = mode_hl_groups[mode:sub(1, 1)] or "SLNormal"
  local hl_alt_group = mode_hl_alt_groups[mode:sub(1, 1)] or "SLNormalAlt"
  local cur = vim.fn.line "."
  local total = vim.fn.line "$"

  if cur == 1 then
    return capsule(hl_alt_group, string.format("%%#%s#%s", hl_group, "0%%"))
  end
  if cur == total then
    return capsule(hl_alt_group, string.format("%%#%s#%s", hl_group, "100%%"))
  end
  local percentage = math.floor(cur / total * 100)
  if percentage < 10 then
    local p = string.format("%d%%%%", percentage)
    return capsule(hl_alt_group, string.format("%%#%s#%s", hl_group, p))
  else
    local p = string.format("%2d%%%%", percentage)
    return capsule(hl_alt_group, string.format("%%#%s#%s", hl_group, p))
  end
end

vim.opt.statusline = table.concat {
  "%{%v:lua.get_mode()%} ",
  "%#StatusLine#",
  "%{%v:lua.get_git_info()%} ",
  "%{%v:lua.get_diagnostics()%}",
  "%=",
  "%{%v:lua.get_llama()%} ",
  "%{%v:lua.get_go_version()%}",
  "%{%v:lua.get_dart_version()%}",
  "%{%v:lua.get_rust_version()%}",
  "%{%v:lua.get_location()%} ",
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
