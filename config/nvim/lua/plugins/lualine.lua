local lualine = require("core.import").import "lualine"
if lualine == nil then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local open_lazygit = function()
  vim.cmd "lua _LAZYGIT_TOGGLE()"
end

local open_diagnostic = function()
  vim.cmd "Telescope diagnostics"
end

local open_lsp_info = function()
  vim.cmd "LspInfo"
end

local mode = {
  "mode",
  icon = "",
  separator = { left = " ", right = "" },
  padding = 0,
}

local branch = {
  "b:gitsigns_head",
  icon = "󰊢",
  on_click = open_lazygit,
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
  symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_in_width,
  source = diff_source,
  on_click = open_lazygit,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
  colored = true,
  update_in_insert = false,
  always_visible = false,
  cond = hide_in_width,
  on_click = open_diagnostic,
}

local lsp_progress_module = {}
local status_lsp_progress_ok, lsp_progress = pcall(require, "lsp-progress")
if status_lsp_progress_ok then
  table.insert(lsp_progress_module, lsp_progress.progress)
  vim.cmd [[
augroup lualine_augroup
    autocmd!
    autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
augroup END
]]
end

local nomodoro_module = {}
local status_nomodoro_ok, nomodoro = pcall(require, "nomodoro")
if status_nomodoro_ok then
  local nomodoro_component = {
    nomodoro.status,
    icon = "󰞌",
    color = { fg = "#F38BA8" },
  }
  nomodoro_module = nomodoro_component
end

local location = function()
  local cursor = vim.fn.line "."
  local column = vim.fn.virtcol "."
  return cursor .. ":" .. column
end

local filetype = {
  "filetype",
  fmt = function(str)
    return str:gsub("^%l", str.upper)
  end,
  on_click = open_lsp_info,
}

local datetime = {
  "datetime",
  style = "%H:%M",
  icon = "󰥔",
  color = { fg = "#A6E3A1" },
}

local function progress_function()
  local cur = vim.fn.line "."
  local total = vim.fn.line "$"
  if cur == 1 then
    return "0%%"
  elseif cur == total then
    return "100%%"
  else
    return string.format("%2d%%%%", math.floor(cur / total * 100))
  end
end

local progress = {
  progress_function,
  icon = "󰦪",
  separator = { left = "", right = " " },
  padding = 0,
}

----------------------------------------------------------------------
--                            Extensions                            --
----------------------------------------------------------------------

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

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "alpha" },
      tabline = { "alpha" },
      winbar = {},
    },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = {},
    lualine_c = { branch, diff, diagnostics },
    lualine_x = {
      lsp_progress_module,
      "selectioncount",
      location,
      filetype,
      nomodoro_module,
      datetime,
    },
    lualine_y = {},
    lualine_z = { progress },
  },
  tabline = {},
  winbar = {},
  extensions = { "man", toggleterm_extension },
}
