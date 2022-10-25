local status_ok, crates = pcall(require, "crates")
if not status_ok then
  vim.notify("Failed to load crates", "error")
  return
end

crates.setup {
  null_ls = {
    enabled = true,
    name = "Crates",
  },
}

local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif
    vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available()
  then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end

vim.keymap.set("n", "K", show_documentation, { noremap = true, silent = true })

-- TODO: Add keymaps

-- local opts = { noremap = true, silent = true }

-- vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
-- vim.keymap.set("n", "<leader>cr", crates.reload, opts)

-- vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
-- vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
-- vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

-- vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
-- vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
-- vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
-- vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
-- vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
-- vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

-- vim.keymap.set("n", "<leader>cH", crates.open_homepage, opts)
-- vim.keymap.set("n", "<leader>cR", crates.open_repository, opts)
-- vim.keymap.set("n", "<leader>cD", crates.open_documentation, opts)
-- vim.keymap.set("n", "<leader>cC", crates.open_crates_io, opts)