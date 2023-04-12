local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Failed to load mason", vim.log.levels.ERROR)
  return
end

mason.setup {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

local mason_lspconfig_status_ok, mason_lspconfig =
  pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  vim.notify("Failed to load mason-lspconfig", vim.log.levels.ERROR)
  return
end

local servers = {
  "lua_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "rust_analyzer",
  "taplo",
}

mason_lspconfig.setup {
  ensure_installed = servers,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("core.lsp.handlers").on_attach,
    capabilities = require("core.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "core.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  if server == "rust_analyzer" then
    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if not rust_tools_status_ok then
      vim.notfiy("Failed to load rust-tools", "error")
      return
    end

    rust_tools.setup {
      tools = {
        on_initialized = function()
          vim.api.nvim_create_autocmd(
            "BufEnter",
            "CursorHold",
            "InsertLeave",
            "BufWritePost",
            {
              pattern = { "*.rs" },
              callback = function()
                vim.cmd [[silent! lua vim.lsp.codelens.refresh() ]]
              end,
            }
          )
        end,
      },
      server = {
        on_attach = require("core.lsp.handlers").on_attach,
        capabilities = require("core.lsp.handlers").capabilities,
        settings = {
          ["rust-analyzer"] = {
            lens = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }

    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
