local function get_macos_theme()
  local handle = io.popen "defaults read -g AppleInterfaceStyle"
  if handle then
    local result = handle:read "*a"
    handle:close()

    if result:match "Dark" then
      return "dark"
    end
  end

  return "light"
end

vim.g.theme_mode = get_macos_theme()
