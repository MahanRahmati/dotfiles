local status_ok, colorscheme = pcall(require, "onedark")
if not status_ok then
  require "notify"("Failed to load colorscheme", "error")
  return
end

colorscheme.setup {
  -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
  style = "darker",
  transparent = false,
}

colorscheme.load()
