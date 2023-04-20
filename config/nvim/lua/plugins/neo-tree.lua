local neo_tree = require("core.import").import "neo-tree"
if neo_tree == nil then
  return
end

vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

neo_tree.setup {
  close_if_last_window = true,
  popup_border_style = "rounded",
  default_component_configs = {
    indent = {
      with_expanders = true,
    },
  },
  window = {
    width = 35,
    mappings = {
      ["<space>"] = "none",
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      show_hidden_count = false,
    },
  },
  event_handlers = {
    {
      event = "file_opened",
      handler = function(_)
        require("neo-tree").close_all()
      end,
    },
    {
      event = "neo_tree_window_after_open",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd "wincmd ="
        end
      end,
    },
    {
      event = "neo_tree_window_after_close",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd "wincmd ="
        end
      end,
    },
  },
}
