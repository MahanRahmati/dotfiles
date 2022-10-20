local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("Failed to load which-key", "error")
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  F = {
    name = "Flutter",
    D = { "<cmd>FlutterDevTools<Cr>", "Dev Tools" },
    d = { "<cmd>FlutterDevices<Cr>", "Devices" },
    e = { "<cmd>FlutterEmulators<Cr>", "Emulators" },
    h = { "<cmd>FlutterReload<Cr>", "Hot Reload" },
    l = { "<cmd>FlutterLspRestart<Cr>", "LSP Restart" },
    o = { "<cmd>FlutterOutlineToggle<Cr>", "Outline Toggle" },
    R = { "<cmd>FlutterRestart<Cr>", "Restart" },
    r = { "<cmd>FlutterRun<Cr>", "Run" },
    q = { "<cmd>FlutterQuit<Cr>", "Quit" },
  },
}

which_key.register(mappings, opts)
