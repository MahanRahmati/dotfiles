return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      local icons = require "icons"

      local signs = {
        { name = "DiagnosticSignError", text = icons.error },
        { name = "DiagnosticSignWarn", text = icons.warn },
        { name = "DiagnosticSignInfo", text = icons.info },
        { name = "DiagnosticSignHint", text = icons.hint },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(
          sign.name,
          { texthl = sign.name, text = sign.text, numhl = "" }
        )
      end

      local config = {
        virtual_text = true, -- enable inline text
        signs = {
          active = signs, -- show signs
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }

      vim.diagnostic.config(config)

      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, {
          border = "rounded",
        })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
          border = "rounded",
        })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end

          local builtin = require "telescope.builtin"

          map("gd", builtin.lsp_definitions, "Definition")
          map("gD", vim.lsp.buf.declaration, "Declaration")
          map("gr", builtin.lsp_references, "References")
          map("gI", builtin.lsp_implementations, "Implementations")
          map("<leader>lr", vim.lsp.buf.rename, "Rename")
          map("<leader>la", vim.lsp.buf.code_action, "Code Action")
          map("<leader>a", vim.lsp.buf.code_action, "Code Action")
          map("<leader>li", "<cmd>LspInfo<CR>", "Info")
          map("<leader>lm", "<cmd>Mason<CR>", "Mason")
          map("<leader>ld", builtin.diagnostics, "Diagnostics")
          map("<leader>lj", vim.diagnostic.goto_next, "Next Diagnostic")
          map("<leader>lk", vim.diagnostic.goto_prev, "Previous Diagnostic")
          map("K", vim.lsp.buf.hover, "Hover Documentation")

          -- Organize imports
          vim.api.nvim_create_user_command("OrganizeImports", function(_)
            vim.lsp.buf.code_action {
              context = { only = { "source.organizeImports" } },
              apply = true,
            }
          end, {})

          -- Fix all lint errors
          vim.api.nvim_create_user_command("FixAll", function(_)
            vim.lsp.buf.code_action {
              context = { only = { "source.fixAll" } },
              apply = true,
            }
          end, {})

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if
            client and client.server_capabilities.documentHighlightProvider
          then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend(
        "force",
        capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        bashls = {},
        jsonls = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              codelenses = {
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              staticcheck = true,
              directoryFilters = {
                "-.git",
                "-node_modules",
              },
              semanticTokens = true,
            },
          },
        },
        zls = {},
        marksman = {},
        ltex = {
          settings = {
            ltex = {
              language = "en-US",
              dictionary = {
                ["en-US"] = { "zig", "const" },
              },
            },
          },
        },
      }

      require("mason").setup {
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

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format lua code
        "goimports", -- Used to format go code
      })
      require("mason-tool-installer").setup {
        ensure_installed = ensure_installed,
      }

      require("mason-lspconfig").setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend(
              "force",
              {},
              capabilities,
              server.capabilities or {}
            )
            require("lspconfig")[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
