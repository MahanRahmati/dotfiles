local function get_ghostty_theme()
  local handle = io.popen "ghostty +show-config"
  if handle then
    local result = handle:read "*a"
    handle:close()

    if result:match "background%s*=%s*#eff1f5" then
      return "light"
    end
  end

  return "dark"
end

vim.g.theme_mode = get_ghostty_theme()
