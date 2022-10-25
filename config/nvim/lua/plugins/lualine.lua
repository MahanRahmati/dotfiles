local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("Failed to load lualine", "error")
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local branch = {
  "b:gitsigns_head",
  icon = "",
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
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_in_width,
  source = diff_source,
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
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return ""
  end
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return "漣" .. client.name
    end
  end
  return ""
end

local filetype = {
  "filetype",
  fmt = function(str)
    return str:gsub("^%l", str.upper)
  end,
}

local winbar_filetype = {
  "filetype",
  icon_only = true,
  padding = { left = 1, right = 0 },
  color = { bg = "#1e222a" },
}

local winbar_filename = {
  "filename",
  color = { bg = "#1e222a" },
}

local winbar_aerial = {
  "aerial",
  sep = " ❯ ",
  color = { bg = "#1e222a" },
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch },
    lualine_c = { diff, diagnostics },
    lualine_x = { "searchcount", lsp, filetype },
    lualine_y = { "location" },
    lualine_z = { "progress" },
  },
  tabline = {},
  winbar = {
    lualine_b = {
      winbar_filetype,
      winbar_filename,
      winbar_aerial,
    },
  },
  inactive_winbar = {
    lualine_c = {
      winbar_filetype,
      winbar_filename,
    },
  },
  extensions = {},
}
