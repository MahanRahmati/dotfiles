local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("Failed to load lualine", "error")
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
  separator = { left = "", right = "" },
  padding = 0,
}

local branch = {
  "b:gitsigns_head",
  icon = "",
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
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = true,
  update_in_insert = false,
  always_visible = false,
  cond = hide_in_width,
  on_click = open_diagnostic,
}

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

local function toggleterm_statusline()
  return "ToggleTerm #" .. vim.b.toggle_number
end

local toggleterm = {
  toggleterm_statusline,
  separator = { left = "", right = "" },
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
    lualine_x = { location, filetype },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  extensions = { "man", toggleterm_extension },
}
