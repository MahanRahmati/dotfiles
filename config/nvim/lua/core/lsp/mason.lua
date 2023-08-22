local mason = require("core.import").import "mason"
if mason == nil then
  return
end

local icons = require "core.icons"

mason.setup {
  ui = {
    border = "rounded",
    max_concurrent_installers = 4,
    icons = {
      package_installed = icons.package_installed,
      package_pending = icons.package_pending,
      package_uninstalled = icons.package_uninstalled,
    },
  },
}

local mason_lspconfig = require("core.import").import "mason-lspconfig"
if mason_lspconfig == nil then
  return
end

local servers = {
  "lua_ls",
  "bashls",
  "jsonls",
  "yamlls",
  "rust_analyzer",
  "taplo",
  "gopls",
}

mason_lspconfig.setup {
  ensure_installed = servers,
}

local lspconfig = require("core.import").import "lspconfig"
if lspconfig == nil then
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
    local rust_tools = require("core.import").import "rust-tools"
    if rust_tools == nil then
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
