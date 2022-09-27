local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("Failed to load lualine", "error")
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local nvim_tree_shift = {
  function()
    return string.rep(
      " ",
      vim.api.nvim_win_get_width(require("nvim-tree.view").get_winnr()) - 1
    )
  end,
  cond = require("nvim-tree.view").is_visible,
  color = "Normal",
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_in_width,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = false,
  update_in_insert = false,
  always_visible = false,
  cond = hide_in_width,
}

local lsp = function()
  local msg = "LS Inactive"
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return "漣" .. client.name
    end
  end
  return msg
end

local filetype = {
  "filetype",
  fmt = function(str)
    return str:gsub("^%l", str.upper)
  end,
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { nvim_tree_shift, "mode" },
    lualine_b = { branch },
    lualine_c = { diff },
    lualine_x = { diagnostics, lsp, filetype },
    lualine_y = { "location" },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
