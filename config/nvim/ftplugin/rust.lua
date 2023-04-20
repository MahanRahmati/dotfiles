local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("Failed to load which-key", vim.log.levels.ERROR)
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
  r = {
    name = "Rust",
    A = { "<cmd>RustHoverRange<Cr>", "Hover Range" },
    a = { "<cmd>RustHoverActions<Cr>", "Hover Actions" },
    c = {
      name = "Cargo",
      r = { "<cmd>lua _CARGO_RUN()<cr>", "Cargo Run" },
      t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
      c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
    },
    d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
    e = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
    H = { "<cmd>RustDisableInlayHints<Cr>", "Disable Hints" },
    h = { "<cmd>RustSetInlayHints<Cr>", "Enable Hints" },
    j = { "<cmd>RustJoinLines<Cr>", "Join Lines" },
    m = {
      name = "Move Item",
      j = { "<cmd>RustMoveItemDown<Cr>", "Move Item Down" },
      k = { "<cmd>RustMoveItemUp<Cr>", "Move Item Up" },
    },
    o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
    p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
    r = { "<cmd>RustRunnables<Cr>", "Runnables" },
    S = { "<cmd>RustSSR<Cr>", "Structural Search Replace" },
    s = {
      "<cmd>RustStartStandaloneServerForBuffer<Cr>",
      "Start Server For Buf",
    },
    t = { "<cmd>RustToggleInlayHints<Cr>", "Toggle Hints" },
    v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
    w = { "<cmd>RustReloadWorkspace<Cr>", "Reload Workspace" },
  },
}

which_key.register(mappings, opts)

local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "message with no corresponding" then
    return
  end

  notify_filter(msg, ...)
end
