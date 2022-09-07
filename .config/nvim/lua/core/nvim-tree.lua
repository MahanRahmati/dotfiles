local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  require "notify"("Failed to load nvim-tree", "error")
  return
end

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    adaptive_size = true,
    width = 30,
    height = 30,
    number = true,
    relativenumber = true,
  },
  renderer = {
    group_empty = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
    remove_file = {
      close_window = true,
    },
  },
}
